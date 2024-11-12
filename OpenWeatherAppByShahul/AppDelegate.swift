//
//  AppDelegate.swift
//  OpenWeatherAppByShahul
//
//  Created by Shahul Hameed Shaik on 11/11/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let navigationController = UINavigationController()
        appCoordinator = AppCoordinator(navigationController: navigationController)
        appCoordinator?.startWeatherAppController()
        
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        
        return true
    }


}

