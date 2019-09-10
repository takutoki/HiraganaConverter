//
//  UINavigationController.swift
//  HiraganaConverter
//
//  Created by takumitokiwa on 2019/09/11.
//  Copyright © 2019 takutoki. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    open override var shouldAutorotate: Bool {
        guard let viewController = self.visibleViewController else { return true }
        return viewController.shouldAutorotate
    }
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        guard let viewController = self.visibleViewController else { return .all }
        return viewController.supportedInterfaceOrientations
    }
}
