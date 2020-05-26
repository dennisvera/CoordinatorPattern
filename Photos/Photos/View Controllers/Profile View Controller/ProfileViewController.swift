//
//  ProfileViewController.swift
//  Photos
//
//  Created by Bart Jacobs on 16/08/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, Storyboardable {

    // MARK: - Storyboardable
    
    static var storyboardName: String {
        return "Profile"
    }
    
    // MARK: - Properties
    
    @IBOutlet var titleLabel: UILabel! {
        didSet {
            // Configure Title Label
            titleLabel.text = title
        }
    }
    
    // MARK: - Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Set Title
        title = "Profile"
    }

}
