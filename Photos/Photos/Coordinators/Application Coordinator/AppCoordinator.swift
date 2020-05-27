//
//  AppCoordinator.swift
//  Photos
//
//  Created by Bart Jacobs on 16/08/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    
    var rootViewController: UIViewController {
        return tabBarController
    }
    
    private let tabBarController = UITabBarController()

    // MARK: - Initialization

    override init() {
        super.init()
        
        // Initialize Child Coordinators
        let photosCoordinator = PhotosCoordinator()
        let profileCoordinator = ProfileCoordinator()
        
        // Update View Controllers
        tabBarController.viewControllers = [
            photosCoordinator.rootViewController,
            profileCoordinator.rootViewController
        ]
        
        // Append to Child Coordinators
        childCoordinators.append(photosCoordinator)
        childCoordinators.append(profileCoordinator)
    }

    // MARK: - Overrides
    
    override func start() {
        childCoordinators.forEach { (childCoordinator) in
            // Start Child Coordinator
            childCoordinator.start()
        }
    }

}
