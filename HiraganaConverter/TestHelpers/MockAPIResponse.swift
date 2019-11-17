//
//  MockAPIResponse.swift
//  HiraganaConverter
//
//  Created by takumitokiwa on 2019/11/17.
//  Copyright © 2019 takutoki. All rights reserved.
//

import Foundation

struct MockAPIResponse: Codable {
    
    let headers: MockAPIHeaderReponse
    let origin: String
    let url: String
}

struct MockAPIHeaderReponse: Codable {
    
    let accept: String
    let acceptEncoding: String
    let acceptLanguage: String
    let host: String
    let userAgent: String
    
    enum CodingKeys: String, CodingKey {
        case accept = "Accept"
        case acceptEncoding = "Accept-Encoding"
        case acceptLanguage = "Accept-Language"
        case host = "Host"
        case userAgent = "User-Agent"
    }
}
