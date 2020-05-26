//
//  TermsViewController.swift
//  Photos
//
//  Created by Bart Jacobs on 01/08/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController, Storyboardable {
    
    // MARK: - Properties
    
    var didCancel: (() -> Void)?
    
    // MARK: - Actions
    
    @IBAction func cancel(_ sender: Any) {
        didCancel?()
    }
    
}
