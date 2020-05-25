//
//  Coordinator.swift
//  Photos
//
//  Created by Dennis Vera on 5/25/20.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import Foundation

protocol Coordinator: AnyObject {
    
    // MARK: - Properties
    
    var didFinish: ((Coordinator) -> Void)? { get set }

    // MARK: - Methods
    
    func start()
}
