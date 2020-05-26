//
//  TermsCoordinator.swift
//  Photos
//
//  Created by Bart Jacobs on 01/08/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit

class TermsCoordinator: Coordinator {
    
    // MARK: - Properties
    
    private let presentingViewController: UIViewController

    // MARK: - Initialization
    
    init(presentingViewController: UIViewController) {
        // Set Presenting View Controller
        self.presentingViewController = presentingViewController
    }

    // MARK: - Overrides
    
    override func start() {
        // Show Terms
        showTerms()
    }
    
    // MARK: - Private API
    
    private func finish() {
        // Dismiss Terms View Controller
        presentingViewController.dismiss(animated: true)
        
        // Invoke Handler
        didFinish?(self)
    }

    // MARK: - Helper Methods
    
    private func showTerms() {
        // Initialize Terms View Controller
        // let termsViewController = TermsViewControllerStoryboard.instantiate()
        // let termsViewController = TermsViewControllerXIB(nibName: TermsViewControllerXIB.nibName, bundle: .main)
        let termsViewController = TermsViewControllerCode()
        
        // Install Handlers
        termsViewController.didCancel = { [weak self] in
            self?.finish()
        }
        
        // Present Terms View Controller
        presentingViewController.present(termsViewController, animated: true)
    }

}
