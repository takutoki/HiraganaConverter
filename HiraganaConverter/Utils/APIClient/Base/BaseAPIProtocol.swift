//
//  BaseAPIProtocol.swift
//  HiraganaConverter
//
//  Created by takumitokiwa on 2019/09/09.
//  Copyright © 2019 takutoki. All rights reserved.
//

import Alamofire
import RxSwift

protocol BaseAPIProtocol {
    
    associatedtype ResponseData: Codable
    
    var baseURL: String { get }
    var headers: HTTPHeaders? { get }
    
    func request(url: String, method: HTTPMethod, parameters: [String : String]? ) -> Observable<ResponseData>
    func handleResponse(_ observer: AnyObserver<ResponseData>, _ response: AFDataResponse<Any>)
    
    func get(path: String, parameters: [String: String]?) -> Observable<ResponseData>
    func post(path: String, parameters: [String : String]?) -> Observable<ResponseData>
}

extension BaseAPIProtocol {
    
    func request(url: String, method: HTTPMethod, parameters: [String : String]? ) -> Observable<ResponseData> {
        return Observable.create{ observer in
            _ = AF.request(url, method: method, parameters: parameters, encoder: URLEncodedFormParameterEncoder(destination: .httpBody), headers: self.headers)
                .responseJSON{ response in self.handleResponse(observer, response) }
                .resume()
            
            return Disposables.create()
        }
    }
    
    func handleResponse(_ observer: AnyObserver<ResponseData>, _ response: AFDataResponse<Any>) {
        switch response.result {
        case .success:
            guard let responseJson = response.data else { return }
            guard let res = try? JSONDecoder().decode(ResponseData.self, from: responseJson) else { return }
            observer.onNext(res)
        case .failure(let error):
            observer.onError(error)
        }
    }
    
    func get(path: String, parameters: [String : String]?) -> Observable<ResponseData> {
        return request(url: baseURL + path, method: .get, parameters: parameters)
    }
    
    func post(path: String, parameters: [String : String]?) -> Observable<ResponseData> {
        return request(url: baseURL + path, method: .post, parameters: parameters)
    }
}
