//
//  VerticalBuyCoordinator.swift
//  Photos
//
//  Created by Dennis Vera on 5/25/20.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import UIKit

class VerticalBuyCoordinator: Coordinator {
    
    // MARK: - Properties
    
    private let navigationController: UINavigationController
    private let presentingViewController: UIViewController
    private let photo: Photo
    
    // MARK: - Initializaton
    
    init(presentingViewController: UIViewController, photo: Photo) {
        self.presentingViewController = presentingViewController
        self.photo = photo
        
        self.navigationController = UINavigationController()
        
        super.init()
        
        self.navigationController.delegate = self
    }
    
    // MARK: - Public API
    
    override func start() {
        if UserDefaults.isSignedIn {
            buyPhoto(photo)
        } else {
            showSignIn()
        }
        
        presentingViewController.present(navigationController, animated: true)
    }
    
    private func showSignIn() {
        // Initialize Sign In View Controller
        let signInViewController = SignInViewController.instantiate()
        
        // Helpers
        let photo = self.photo
        
        // Install Handlers
        signInViewController.didSignIn = { [weak self] token in
            UserDefaults.token = token
            
            // Buy Photo
            self?.buyPhoto(photo)
        }
        
        signInViewController.didCancel = { [weak self] in
            self?.finish()
        }
        
        // Push View Controller Onto Navigation Stack
        navigationController.pushViewController(signInViewController, animated: true)
    }
    
    private func finish() {
        presentingViewController.dismiss(animated: true)
        
        didFinish?(self)
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
            
            // Finish
            self?.finish()
        }
        
        buyViewController.didCancel = { [weak self] in
            self?.finish()
        }
        
        // Push Buy View Controller Onto Navigation Stack
        navigationController.pushViewController(buyViewController, animated: true)
    }
}
