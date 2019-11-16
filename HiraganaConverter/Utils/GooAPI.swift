//
//  GooAPI.swift
//  HiraganaConverter
//
//  Created by takumitokiwa on 2019/09/09.
//  Copyright © 2019 takutoki. All rights reserved.
//

import Alamofire
import RxSwift

class GooAPI: BaseAPIProtocol {

    typealias ResponseData = GooAPIResponse
    
    var baseURL: String = Constants.url.gooAPI
    var headers: HTTPHeaders? = [.accept("application/json")]
    let appID = "42a130a4a62eb8aa2552e5fcc89fd9ee00f36c0a9c6122b119a5797e468e9ac7"
    
    func get(path: String, parameters: [String : String]?) -> Observable<ResponseData> {
        return request(url: baseURL + path, method: .get, parameter: mergeAppKeyParameter(parameters))
    }
    
    func post(path: String, parameter: [String : String]?) -> Observable<ResponseData> {
        return request(url: baseURL + path, method: .post, parameter: mergeAppKeyParameter(parameter))
    }
    
    func mergeAppKeyParameter(_ parameter: [String : String]?) -> [String : String] {
        guard let safeParameter = parameter else { return [:] }
        return safeParameter.merging(["app_id": appID]) { $1 }
    }
}
