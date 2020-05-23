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
    
    // MARK: - Properties
    
    private let navigationController = UINavigationController()
    
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
            self?.buyPhoto(photo)
        }
        
        // Push Photo View Controller Onto Navigation Stack
        navigationController.pushViewController(photoViewController, animated: true)
    }
    
    // MARK: -
    
    private func buyPhoto(_ photo: Photo) {
        // Initialize Buy View Controller
        let buyViewController = BuyViewController.instantiate()
        
        // Configure Buy View Controller
        buyViewController.photo = photo
        
        // Install Handlers
        buyViewController.didCancel = { [weak self] in
            // Pop View Controller From Navigation Stack
            self?.navigationController.popViewController(animated: true)
        }
        
        buyViewController.didBuyPhoto = { [weak self] _ in
            // Update User Defaults
            UserDefaults.buy(photo: photo)

            // Pop View Controller From Navigation Stack
            self?.navigationController.popViewController(animated: true)
        }
        
        // Push Buy View Controller Onto Navigation Stack
        navigationController.pushViewController(buyViewController, animated: true)
    }
    
}
