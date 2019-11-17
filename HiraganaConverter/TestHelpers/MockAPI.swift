//
//  MockAPI.swift
//  HiraganaConverter
//
//  Created by takumitokiwa on 2019/11/17.
//  Copyright © 2019 takutoki. All rights reserved.
//

import Alamofire
import RxSwift

class MockAPI: BaseAPIProtocol {

    typealias ResponseData = MockAPIResponse
    
    var baseURL: String = "\(Constants.url.urlScheme)httpbin.org/get"
    var headers: HTTPHeaders? = [.accept("application/json")]
    
    func get(path: String, parameters: [String : String]?) -> Observable<MockAPIResponse> {
        return request(url: baseURL, method: .get, parameters: parameters)
    }
}
