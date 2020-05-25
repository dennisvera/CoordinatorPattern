//
//  AppCoordinator.swift
//  Photos
//
//  Created by Bart Jacobs on 14/06/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit
import Foundation

class AppCoordinator: Coordinator {

    // MARK: - Properties
    
    private let navigationController = UINavigationController()
    
    private var childCoordinators: [Coordinator] = []
        
    // MARK: - Public API
    
    var rootViewController: UIViewController {
        return navigationController
    }
    
    // MARK: -
    
    override func start() {
        // Set Navigation Controller Delegate
        navigationController.delegate = self
        
        // Show Photos
        showPhotos()
    }
    
    override func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController,
                              animated: Bool) {
        
        childCoordinators.forEach { childCoordinator in
            childCoordinator.navigationController(navigationController, willShow: viewController, animated: animated)
        }
    }
    
    override func navigationController(_ navigationController: UINavigationController,
                              didShow viewController: UIViewController,
                              animated: Bool) {
        
        childCoordinators.forEach { childCoordinator in
            childCoordinator.navigationController(navigationController, didShow: viewController, animated: animated)
        }
    }
    
    // MARK: - Helper Methods
    
    private func showPhotos() {
        // Initialize Photos View Controller
        let photosViewController = PhotosViewController.instantiate()
        
        // Install Handlers
        photosViewController.didSignIn = { [weak self] in
            self?.showSignIn()
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
            self?.buyPhoto(photo)
        }
        
        // Push Photo View Controller Onto Navigation Stack
        navigationController.pushViewController(photoViewController, animated: true)
    }
    
    // MARK: -
    
    private func showSignIn() {
        // Initialize Sign In View Controller
        let signInViewController = SignInViewController.instantiate()
        
        // Install Handlers
        signInViewController.didSignIn = { [weak self] token in
            UserDefaults.token = token
            
            // Dismiss View Controller
            self?.navigationController.dismiss(animated: true)
        }
        
        signInViewController.didCancel = { [weak self] in
            self?.navigationController.dismiss(animated: true)
        }
        
        // Push View Controller Onto Navigation Stack
        self.navigationController.present(signInViewController, animated: true)
    }
    
    // MARK: -
    
    private func buyPhoto(_ photo: Photo) {
        // Initialize Buy Coordinator
        let buyCoordinator = VerticalBuyCoordinator(presentingViewController: navigationController, photo: photo)
        
        // Start Buy Coordinator
        pushCoordinator(buyCoordinator)
    }
    
    private func pushCoordinator(_ coordinator: Coordinator) {
        coordinator.didFinish = { [weak self] coordinator in
            self?.popCoordinator(coordinator)
        }
        
        coordinator.start()
        
        childCoordinators.append(coordinator)
    }
    
    private func popCoordinator(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
}
