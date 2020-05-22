//
//  AppCoordinator.swift
//  Quotes
//
//  Created by Dennis Vera on 5/22/20.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import UIKit

class AppCoordinator {
    
    // MARK: Properties

    private let navigationController = UINavigationController()
    
    // MARK: - Public API
    
    var rootViewControlller: UIViewController {
        return navigationController
    }
    
    // MARK: -
    
    func start() {
        showQuotes()
    }
    
    // MARK: - Helper Methods
    
    private func showQuotes() {
        // Initialize Quotes View Controller
        guard let quotesViewController = UIStoryboard(name: "Main",
                                                      bundle: .main).instantiateViewController(withIdentifier: "QuotesViewController") as? QuotesViewController else {
                                                        fatalError("Unable to Instantiate Quotes View Controller")
        }
        
        // Push Quotes View Controller Onto Navigation Stack
        navigationController.pushViewController(quotesViewController, animated: true)
    }
}
