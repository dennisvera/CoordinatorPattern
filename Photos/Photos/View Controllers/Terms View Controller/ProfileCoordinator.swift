//
//  ProfileCoordinator.swift
//  Photos
//
//  Created by Dennis Vera on 5/26/20.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import UIKit

class ProfileCoordinator: Coordinator {
    
    var rootViewController: UIViewController {
        return profileViewController
    }
    
    private let profileViewController = ProfileViewController.instantiate()
}
