//
//  TermsCoordinator.swift
//  Photos
//
//  Created by Dennis Vera on 5/26/20.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import UIKit

class TermsCoordinator: Coordinator {
    
    // MARK: - Properties
    
    private var presentingViewController: UIViewController
    
    // MARK: - Initialization
    
    init(presentingViewController: UIViewController) {
        // Set Presenting View Controller
        self.presentingViewController = presentingViewController
    }
    
    // MARK: - Overrides
    
    override func start() {
        showTerms()
    }
    
    private func finish() {
        presentingViewController.dismiss(animated: true)
        
        didFinish?(self)
    }
    
    // MARK: - Helper Methods
    
    private func showTerms() {
        let termsViewController = TermsViewController.instantiate()
        
        termsViewController.didCancel = { [weak self] in
            self?.finish()
        }
        
        presentingViewController.present(termsViewController, animated: true)
    }
}
