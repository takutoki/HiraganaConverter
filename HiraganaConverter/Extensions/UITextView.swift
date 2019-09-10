//
//  UITextView.swift
//  HiraganaConverter
//
//  Created by takumitokiwa on 2019/09/09.
//  Copyright © 2019 takutoki. All rights reserved.
//

import UIKit

extension UITextView {
    
    func defaultBorder() {
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1.0
        layer.masksToBounds = true
    }
}
