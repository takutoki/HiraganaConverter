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
    
    var baseURL: String { get }
    var headers: HTTPHeaders? { get }
    
    func post(path: String, parameter: [String : String]?) -> Observable<GooAPIResponse>
}
