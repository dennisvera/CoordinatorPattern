//
//  UserDefaults+Settings.swift
//  Quotes
//
//  Created by Bart Jacobs on 30/05/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    // MARK: - Keys
    
    private enum Keys {
        static let fontSize = "fontSize"
        static let fontWeight = "fontWeight"
    }
    
    // MARK: - Settings
    
    class var fontSize: Float {
        set {
            // Update User Defaults
            UserDefaults.standard.set(newValue, forKey: Keys.fontSize)
            
            // Post Notification
            NotificationCenter.default.post(name: .fontSizeDidChange, object: nil)
        }
        get {
            guard UserDefaults.standard.object(forKey: Keys.fontSize) != nil else {
                return 17.0
            }
            
            return UserDefaults.standard.float(forKey: Keys.fontSize)
        }
    }
    
    class var fontWeight: FontWeight {
        set {
            // Update User Defaults
            UserDefaults.standard.set(newValue.rawValue, forKey: Keys.fontWeight)
            
            // Post Notification
            NotificationCenter.default.post(name: .fontWeightDidChange, object: nil)
        }
        get {
            guard UserDefaults.standard.object(forKey: Keys.fontWeight) != nil else {
                return .regular
            }
            
            return FontWeight(rawValue: UserDefaults.standard.integer(forKey: Keys.fontWeight)) ?? .regular
        }
    }
    
}
