//
//  Coordinator.swift
//  Photos
//
//  Created by Dennis Vera on 5/25/20.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
    
    // MARK: - Properties
    
    var didFinish: ((Coordinator) -> Void)? { get set }
    
    // MARK: - Methods
    
    func start()
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool)
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool)
}

extension Coordinator {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) { }
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) { }
}
