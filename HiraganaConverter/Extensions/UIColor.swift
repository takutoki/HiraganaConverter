//
//  UIColor.swift
//  HiraganaConverter
//
//  Created by takumitokiwa on 2019/09/11.
//  Copyright © 2019 takutoki. All rights reserved.
//

import UIKit

extension UIColor {
    
    static let dodgerBlue: UIColor = UIColor(hexStr: "1e90ff")
    
    convenience init(hexStr: String, alpha: CGFloat = 1.0) {
        let hexStrWithoutSharp = hexStr.replacingOccurrences(of: "#", with: "")
        let v = hexStrWithoutSharp.map { String($0) } + Array(repeating: "0", count: max(6 - hexStrWithoutSharp.count, 0))
        let r = CGFloat(Int(v[0] + v[1], radix: 16) ?? 0) / 255.0
        let g = CGFloat(Int(v[2] + v[3], radix: 16) ?? 0) / 255.0
        let b = CGFloat(Int(v[4] + v[5], radix: 16) ?? 0) / 255.0
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}
