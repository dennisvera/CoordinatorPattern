//
//  AppCoordinator.swift
//  Photos
//
//  Created by Dennis Vera on 5/26/20.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var rootViewController: UIViewController {
        return tabBarController
    }
    
    private let tabBarController = UITabBarController()
    
    override init() {
        super.init()
        
        
        let photosCoordinator = PhotosCoordinator()
        let profileCoordinator = ProfileCoordinator()
        
        tabBarController.viewControllers = [
            photosCoordinator.rootViewController,
            profileCoordinator.rootViewController
        ]
        
        childCoordinators.append(photosCoordinator)
        childCoordinators.append(profileCoordinator)
    }
    
    override func start() {
        childCoordinators.forEach { coordinators in
            coordinators.start()
        }
    }
    
}
