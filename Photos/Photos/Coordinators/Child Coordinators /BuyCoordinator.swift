//
//  BuyCoordinator.swift
//  Photos
//
//  Created by Dennis Vera on 5/25/20.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import UIKit

class BuyCoordinator: Coordinator {
    
    // MARK: - Properties
    
    private let photo: Photo
    private let navigationController: UINavigationController
    private var initialViewController: UIViewController?
    private var presentingViewController: UIViewController?
        
    // MARK: - Intialaization
    
    init(navigationController: UINavigationController, photo: Photo) {
        // Set Navigation Controller
        self.navigationController = navigationController
        
        // Set Photo
        self.photo = photo
        
        // Set Initial View Controller
        self.initialViewController = navigationController.viewControllers.last
        
        super.init()
    }
    
    init(presentingViewController: UIViewController, photo: Photo) {
        self.presentingViewController = presentingViewController
        self.photo = photo
        
        self.navigationController = UINavigationController()
        
        super.init()
        
        self.navigationController.delegate = self
    }
    
    deinit {
        print("DEALLOCATING BUY COORDIONATOR")
    }
    
    // MARK: - Public API
    
    override func start() {
        if UserDefaults.isSignedIn {
            buyPhoto(photo)
        } else {
            showSignIn()
        }
        
        presentingViewController?.present(navigationController, animated: true)
    }
    
    override func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if viewController === initialViewController {
            // Invoke Handler
            didFinish?(self)
        }
    }
    
    // MARK: - Private API
    
    private func finish() {
        // Reset Navigation Controller
        if let viewController = initialViewController {
            // Pop to Intial Root View Controller
            navigationController.popToViewController(viewController, animated: true)
        } else {
            // Dismiss Navaigation Controller
            presentingViewController?.dismiss(animated: true)
            
            // Invoke Handler
            didFinish?(self)
        }
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
