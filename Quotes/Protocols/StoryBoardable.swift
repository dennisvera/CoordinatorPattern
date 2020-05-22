//
//  StoryBoardable.swift
//  Quotes
//
//  Created by Dennis Vera on 5/22/20.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import UIKit

protocol StoryBoardable {
    
    // MARK: - Properties
    
    static var storyBoardName: String { get }
    static var storyBoardBundle: Bundle { get }
    static var storyBoardIdentifier: String { get }
    
    // MARK: - Methods
    
    static func instantiate() -> Self
}

extension StoryBoardable where Self: UIViewController {
    
    // MARK: - Properties
    
    static var storyBoardName: String {
        return "Main"
    }
    
    static var storyBoardBundle: Bundle {
        return .main
    }
    
    static var storyBoardIdentifier: String {
        return String(describing: self)
    }
    
    // MARK: - Methods
    
    static func instantiate() -> Self {
        guard let viewController = UIStoryboard(name: storyBoardName,
                                                bundle: storyBoardBundle).instantiateViewController(withIdentifier: storyBoardIdentifier) as? Self else {
                                                    fatalError("Unable to Instantiate View Controller With StoryBoard Identifier \(storyBoardIdentifier)")
        }
        
        return viewController
    }
}
