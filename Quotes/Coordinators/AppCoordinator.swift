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
        let quotesViewController = QuotesViewController.instantiate()
        
         // Configure Quotes View Controller
        quotesViewController.didShowQuote = { [weak self] quote in
            guard let strongSelf = self else { return }
            strongSelf.showQuote(quote)
        }
        
        quotesViewController.didShowSettings = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.showSettings()
        }
        
        // Push Quotes View Controller Onto Navigation Stack
        navigationController.pushViewController(quotesViewController, animated: true)
    }
    
    private func showQuote(_ quote: Quote) {
        // Initialize Quote View Controller
        let quoteViewController = QuoteViewController.instantiate()
        
        // Configure Quote View Controller
        quoteViewController.quote = quote
        
        // Push Quote View Controller Onto Navigation Stack
        navigationController.pushViewController(quoteViewController, animated: true)
    }
    
    private func showSettings() {
        // Initialize Settings View Controller
        let settingsViewController = SettingsViewController.instantiate()
        
        // Configure Settings View Controller
        settingsViewController.didDissmiss = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.navigationController.dismiss(animated: true)
        }
        
        // Push Settings View Controller Onto Navigation Stack
        navigationController.present(settingsViewController, animated: true)
    }
}
