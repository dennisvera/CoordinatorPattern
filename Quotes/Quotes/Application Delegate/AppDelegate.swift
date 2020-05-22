//
//  AppDelegate.swift
//  Quotes
//
//  Created by Bart Jacobs on 30/05/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties
    
    var window: UIWindow?
    
    private let appCoordinator = AppCoordinator()

    // MARK: - Application Life Cycle

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize Window
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Configure Window
        window?.rootViewController = appCoordinator.rootViewControlller
        
        // Make Key and Visible
        window?.makeKeyAndVisible()
        
        // Start Coordinator
        appCoordinator.start()
        
        return true
    }

}
