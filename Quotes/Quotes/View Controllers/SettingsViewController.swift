//
//  SettingsViewController.swift
//  Quotes
//
//  Created by Bart Jacobs on 30/05/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, StoryBoardable {
    
    // MARK: - Properties
    
    var didDissmiss: (() -> Void)?
    
    @IBOutlet var fontSizeSlider: UISlider! {
        didSet {
            // Configure Font Size Slider
            fontSizeSlider.value = UserDefaults.fontSize
        }
    }
    
    // MARK: -
    
    @IBOutlet var fontWeightSegmentedControl: UISegmentedControl! {
        didSet {
            // Configure Font Weight Segmented Control
            fontWeightSegmentedControl.selectedSegmentIndex = UserDefaults.fontWeight.rawValue
        }
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions

    @IBAction func dismiss(_ sender: Any) {
        // Invoke Handler
       didDissmiss?()
    }
    
    @IBAction func fontSizeDidChange(_ sender: Any) {
        // Update User Defaults
        UserDefaults.fontSize = fontSizeSlider.value
    }
    
    @IBAction func fontWeightDidChange(_ sender: Any) {
        guard let fontWeight = FontWeight(rawValue: fontWeightSegmentedControl.selectedSegmentIndex) else {
            return
        }
        
        // Update User Defaults
        UserDefaults.fontWeight = fontWeight
    }
    
}
