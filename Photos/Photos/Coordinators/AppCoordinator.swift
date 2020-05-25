//
//  AppCoordinator.swift
//  Photos
//
//  Created by Bart Jacobs on 14/06/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit
import Foundation

class AppCoordinator {
    
    private enum PresentationStyle {
        
        case present
        case push
    }
    
    // MARK: - Properties
    
    private let navigationController = UINavigationController()
    
    private var isBuyingPhoto: Photo?
    
    // MARK: - Public API
    
    var rootViewController: UIViewController {
        return navigationController
    }
    
    // MARK: -
    
    func start() {
        showPhotos()
    }
    
    // MARK: - Helper Methods
    
    private func showPhotos() {
        // Initialize Photos View Controller
        let photosViewController = PhotosViewController.instantiate()
        
        // Install Handlers
        photosViewController.didSignIn = { [weak self] in
            self?.showSignIn(style: .present)
        }
        
        photosViewController.didSelectPhoto = { [weak self] (photo) in
            self?.showPhoto(photo)
        }
        
        // Push Photos View Controller Onto Navigation Stack
        navigationController.pushViewController(photosViewController, animated: true)
    }

    // MARK: -
    
    private func showPhoto(_ photo: Photo) {
        // Initialize Photo View Controller
        let photoViewController = PhotoViewController.instantiate()
        
        // Configure Photo View Controller
        photoViewController.photo = photo
        
        // Install Handlers
        photoViewController.didBuyPhoto = { [weak self] (photo) in
            self?.isBuyingPhoto = photo
            
            if UserDefaults.isSignedIn {
                self?.buyPhoto(photo)
            } else {
                self?.showSignIn(style: .push)
            }
        }
        
        // Push Photo View Controller Onto Navigation Stack
        navigationController.pushViewController(photoViewController, animated: true)
    }
    
    // MARK: -
    
    private func showSignIn(style: PresentationStyle) {
        // Initialize Sign In View Controller
        let signInViewController = SignInViewController.instantiate()
        
        // Install Handlers
        signInViewController.didSignIn = { [weak self] token in
            UserDefaults.token = token
            
            if let photo = self?.isBuyingPhoto {
                self?.buyPhoto(photo)
            } else {
                self?.navigationController.dismiss(animated: true)
                
            }
        }
        
        // Install Handlers
        signInViewController.didCancel = { [weak self] in
            self?.navigationController.dismiss(animated: true)
        }
        
        switch style {
        case .present:
            // Push Sign In View Controller Onto Navigation Stack
            navigationController.present(signInViewController, animated: true)
        case .push:
            navigationController.pushViewController(signInViewController, animated: true)
        }
    }
    
    // MARK: -
    
    private func buyPhoto(_ photo: Photo) {
        // Initialize Buy View Controller
        let buyViewController = BuyViewController.instantiate()
        
        // Configure Buy View Controller
        buyViewController.photo = photo
        
        // Install Handlers
        buyViewController.didCancel = { [weak self] in
            self?.isBuyingPhoto = nil
            
            if let viewController = self?.navigationController.viewControllers.first(where: { $0 is PhotoViewController }) {
                self?.navigationController.popToViewController(viewController, animated: true)
            } else {
                self?.navigationController.popToRootViewController(animated: true)
            }
        }
        
        buyViewController.didBuyPhoto = { [weak self] _ in
            self?.isBuyingPhoto = nil
            
            // Update User Defaults
            UserDefaults.buy(photo: photo)
            
            if let viewController = self?.navigationController.viewControllers.first(where: { $0 is PhotoViewController }) {
                self?.navigationController.popToViewController(viewController, animated: true)
            } else {
                self?.navigationController.popToRootViewController(animated: true)
            }
        }
        
        // Push Buy View Controller Onto Navigation Stack
        navigationController.pushViewController(buyViewController, animated: true)
    }
    
}
