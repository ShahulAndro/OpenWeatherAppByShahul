//
//  AppCoordinator.swift
//  OpenWeatherAppByShahul
//
//  Created by Shahul Hameed Shaik on 11/11/2024.
//

import UIKit

//MARK: - AppCoordinator
class AppCoordinator {
    
    let navigationController: UINavigationController
    
    //MARK: - init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //MARK: - startWeatherAppController
    func startWeatherAppController() {
        let searchCoordinator = SearchCoordinator(navigationController: navigationController)
        searchCoordinator.start()
    }
}
