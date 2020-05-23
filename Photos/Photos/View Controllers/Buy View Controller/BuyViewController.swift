//
//  BuyViewController.swift
//  Photos
//
//  Created by Bart Jacobs on 15/06/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController, Storyboardable {

    // MARK: - Properties
    
    @IBOutlet weak var buyButton: UIButton!
    
    // MARK: -
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    // MARK: -
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView! {
        didSet {
            // Configure Activity Indicator View
            activityIndicatorView.hidesWhenStopped = true
        }
    }
    
    // MARK: -
    
    var photo: Photo?
    
    // MARK: -
    
    var didCancel: (() -> Void)?
    
    // MARK: -
    
    var didBuyPhoto: ((Photo) -> Void)?

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup View
        setupView()
    }
    
    // MARK: - View Methods
    
    private func setupView() {
        // Add Bar Button Item
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel(_:)))
        
        // Setup Title Label
        setupTitleLabel()
        
        // Setup Price Label
        setupPriceLabel()
    }
    
    // MARK: -
    
    private func setupTitleLabel() {
        // Configure Title Label
        titleLabel.text = photo?.title
    }
    
    private func setupPriceLabel() {
        // Helpers
        var formattedPrice: String?
        
        if let price = photo?.price {
            // Initialize Numbe Formatter
            let numberFormatter = NumberFormatter()
            
            // Configure Numbe Formatter
            numberFormatter.locale = Locale.current
            numberFormatter.numberStyle = .currency
            
            // Update Formatted Price
            formattedPrice = numberFormatter.string(from: NSNumber(value: price))
        }
        
        if let text = formattedPrice {
            // Configure Price Label
            priceLabel.text = text

        } else {
            // Configure Price Label
            priceLabel.text = "-"
            
            // Disable Buy Button
            buyButton.isEnabled = false
        }
    }
    
    // MARK: - Actions

    @IBAction func buy(_ sender: Any) {
        guard let photo = photo else {
            return
        }
        
        // Show Activity Indicator View
        activityIndicatorView.startAnimating()
        
        // Hide Buy Button
        buyButton.isHidden = true
        
        // Disable Cancel Button
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        DispatchQueue.global().async {
            sleep(2)
            
            DispatchQueue.main.async {
                // Hide Activity Indicator View
                self.activityIndicatorView.stopAnimating()
                
                // Enable Cancel Button
                self.navigationItem.rightBarButtonItem?.isEnabled = true
                
                // Invoke Handler
                self.didBuyPhoto?(photo)
            }
        }
    }

    @objc func cancel(_ sender: UIBarButtonItem) {
        didCancel?()
    }

}
