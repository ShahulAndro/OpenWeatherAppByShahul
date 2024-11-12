//
//  SearchCoordinator.swift
//  OpenWeatherAppByShahul
//
//  Created by Shahul Hameed Shaik on 12/11/2024.
//

import UIKit

struct SearchCoordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let searchViewController = SearchViewController()
        self.navigationController.pushViewController(searchViewController, animated: true)
    }
    
}
