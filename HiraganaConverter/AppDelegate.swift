//
//  AppDelegate.swift
//  HiraganaConverter
//
//  Created by takumitokiwa on 2019/09/04.
//  Copyright © 2019 takutoki. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setUpFirstViewController()
        return true
    }
    
    private func setUpFirstViewController() {
        navigationController = UINavigationController(rootViewController: createFirstViewController())
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    private func createFirstViewController() -> UIViewController {
        let model = HiraganaConverterModel()
        let viewModel = HiraganaConverterViewModel(inject: model)
        return CounvertViewController(inject: viewModel)
    }
}

