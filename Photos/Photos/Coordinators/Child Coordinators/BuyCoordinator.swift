//
//  BuyCoordinator.swift
//  Photos
//
//  Created by Bart Jacobs on 27/06/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit

class BuyCoordinator: Coordinator {
    
    // MARK: - Properties
    
    private let photo: Photo
    
    // MARK: -
    
    private let navigationController: UINavigationController
    
    // MARK: -
    
    private var initialViewController: UIViewController?
    
    // MARK: -
    
    private var presentingViewController: UIViewController?
    
    // MARK: - Initialization
    
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
        // Set Presenting View Controller
        self.presentingViewController = presentingViewController
        
        // Set Photo
        self.photo = photo
        
        // Initialize Navigation Controller
        self.navigationController = UINavigationController()
        
        super.init()
        
        // Configure Navigation Controller
        navigationController.delegate = self
    }

    // MARK: - Overrides
    
    override func start() {
        if UserDefaults.isSignedIn {
            buyPhoto(photo)
        } else {
            showSignIn()
        }
        
        // Present Navigation Controller
        presentingViewController?.present(navigationController, animated: true)
    }

    
    // MARK: -
    
    override func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if viewController === initialViewController {
            didFinish?(self)
        }
    }

    // MARK: - Private API
    
    private func finish() {
        // Reset Navigation Controller
        if let viewController = initialViewController {
            // Pop to Initial Root View Controller
            navigationController.popToViewController(viewController, animated: true)
        } else {
            // Dismiss Navigation Controller
            presentingViewController?.dismiss(animated: true)
            
            // Invoke Handler
            didFinish?(self)
        }
    }

    // MARK: - Helper Methods

    private func showSignIn() {
        // Initialize Sign In View Controller
        let signInViewController = SignInViewController.instantiate()
        
        // Helpers
        let photo = self.photo
        
        // Install Handlers
        signInViewController.didSignIn = { [weak self] (token) in
            // Update User Defaults
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
        
        buyViewController.didShowTerms = { [weak self] in
            self?.showTerms()
        }
        
        // Push Buy View Controller Onto Navigation Stack
        navigationController.pushViewController(buyViewController, animated: true)
    }
    
    private func showTerms() {
        let termsCoordinator = TermsCoordinator(presentingViewController: navigationController)
        
        pushCoordinator(termsCoordinator)
    }

}
