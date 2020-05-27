//
//  ProfileCoordinator.swift
//  Photos
//
//  Created by Bart Jacobs on 16/08/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit

class ProfileCoordinator: Coordinator {
    
    // MARK: - Properties
    
    var rootViewController: UIViewController {
        return profileViewController
    }
    
    // MARK: -
    
    private let profileViewController = ProfileViewController.instantiate()
    
}
