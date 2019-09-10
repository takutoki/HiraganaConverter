//
//  GooAPIResponse.swift
//  HiraganaConverter
//
//  Created by takumitokiwa on 2019/09/09.
//  Copyright © 2019 takutoki. All rights reserved.
//

import SwiftyJSON

struct GooAPIResponse {
    
    var converted: String
    var outputType: String
    var requestId: String
    
    init(json: JSON) {
        converted = json[""].stringValue
        outputType = json[""].stringValue
        requestId = json[""].stringValue
    }
}
