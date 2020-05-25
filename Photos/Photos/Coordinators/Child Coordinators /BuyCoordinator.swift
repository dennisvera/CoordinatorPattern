//
//  BuyCoordinator.swift
//  Photos
//
//  Created by Dennis Vera on 5/25/20.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import UIKit

class BuyCoordinator {
    
    // MARK: - Properties
    
    private var navigationController: UINavigationController
    
    private var photo: Photo
    
    
    // MARK: - Intialaization
    
    init(navigationController: UINavigationController, photo: Photo) {
        self.navigationController = navigationController
        self.photo = photo
    }
    
    // MARK: - Helper Methods
    
    func start() {
        
        if UserDefaults.isSignedIn {
            buyPhoto(photo)
        } else {
            showSignIn()
        }
    }
    
    private func finish() {
        
    }
    
    private func showSignIn() {
        // Initialize Sign In View Controller
        let signInViewController = SignInViewController.instantiate()
        
        let photo = self.photo
        
        // Install Handlers
        signInViewController.didSignIn = { [weak self] token in
            UserDefaults.token = token
            
            // Buy Photo
            self?.buyPhoto(photo)
        }
        
        // Install Handlers
        signInViewController.didCancel = { [weak self] in
            self?.finish()
        }
        
        navigationController.pushViewController(signInViewController, animated: true)
    }
    
    private func buyPhoto(_ photo: Photo) {
        // Initialize Buy View Controller
        let buyViewController = BuyViewController.instantiate()
        
        // Configure Buy View Controller
        buyViewController.photo = photo
        
        // Install Handlers
        buyViewController.didBuyPhoto = { [weak self] _ in
            // Update User Defaults
            UserDefaults.buy(photo: photo)
            
            self?.finish()
        }
        
        buyViewController.didCancel = { [weak self] in
            self?.finish()
        }
        
        // Push Buy View Controller Onto Navigation Stack
        navigationController.pushViewController(buyViewController, animated: true)
    }
}
