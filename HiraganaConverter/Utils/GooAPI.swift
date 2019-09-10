//
//  GooAPI.swift
//  HiraganaConverter
//
//  Created by takumitokiwa on 2019/09/09.
//  Copyright © 2019 takutoki. All rights reserved.
//

import Alamofire
import SwiftyJSON
import RxSwift

class GooAPI: BaseAPIProtocol {
    
    var baseURL: String = Constants.url.gooAPI
    var headers: HTTPHeaders? = [:]
    let appID = "42a130a4a62eb8aa2552e5fcc89fd9ee00f36c0a9c6122b119a5797e468e9ac7"
    
    private func request(url: String, method: HTTPMethod, parameter: [String : Any] ) -> Observable<GooAPIResponse> {
        return Observable.create{ [weak self] observer in
            _ = AF.request(url, method: method, parameters: parameter, headers: self?.headers)
                .responseJSON{ [weak self] response in self?.handleResponse(observer, response) }
                .resume()
            
            return Disposables.create()
        }
    }
    
    private func handleResponse(_ observer: AnyObserver<GooAPIResponse>, _ response: AFDataResponse<Any>) {
        switch response.result {
        case .success:
            let gooApiResponse = GooAPIResponse(json: JSON(response.value!))
            observer.onNext(gooApiResponse)
        case .failure(let error):
            observer.onError(error)
        }
    }
    
    func post(path: String, parameter: [String : Any]?) -> Observable<GooAPIResponse> {
        return request(url: baseURL + path, method: .post, parameter: mergeAppKeyParameter(parameter))
    }
    
    func mergeAppKeyParameter(_ parameter: [String : Any]?) -> [String : Any] {
        guard let safeParameter = parameter else { return [:] }
        return safeParameter.merging(["app_id": appID]) { $1 }
    }
}
