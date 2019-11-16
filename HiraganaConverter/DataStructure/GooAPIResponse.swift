//
//  GooAPIResponse.swift
//  HiraganaConverter
//
//  Created by takumitokiwa on 2019/09/09.
//  Copyright © 2019 takutoki. All rights reserved.
//

import Foundation

struct GooAPIResponse: Codable {
    
    var converted: String
    var outputType: String
    var requestId: String
    
    enum CodingKeys: String, CodingKey {
        case converted
        case outputType = "output_type"
        case requestId = "request_id"
    }
}
