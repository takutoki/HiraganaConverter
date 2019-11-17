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
        
    func post(path: String, parameters: [String : String]?) -> Observable<ResponseData> {
        return request(url: baseURL + path, method: .post, parameters: mergeAppKeyParameter(parameters))
    }
    
    func mergeAppKeyParameter(_ parameters: [String : String]?) -> [String : String] {
        guard let safeParameters = parameters else { return ["app_id": appID] }
        return safeParameters.merging(["app_id": appID]) { $1 }
    }
}
