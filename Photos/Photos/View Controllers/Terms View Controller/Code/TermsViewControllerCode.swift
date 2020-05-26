//
//  TermsViewControllerCode.swift
//  Photos
//
//  Created by Bart Jacobs on 01/08/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit

class TermsViewControllerCode: TermsViewController {
    
    // MARK: - Properties
    
    private let termsOfService = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ac dolor justo, ac tempus leo. Etiam pulvinar eros at lectus sollicitudin scelerisque. Aliquam erat volutpat. Suspendisse eu eros non elit blandit suscipit. Morbi scelerisque euismod tempus. Vestibulum elementum tincidunt tempor. Mauris sodales tristique adipiscing. Sed venenatis lorem quis eros hendrerit consequat. Sed a est leo. Donec sapien libero, rutrum eget luctus ac, accumsan vel lectus. Ut quis libero ante. Ut volutpat, massa ac aliquam molestie, neque est blandit diam, non adipiscing purus magna vitae massa. Vestibulum fermentum consectetur sem, non aliquet nisl varius porta. Nulla consectetur tellus vel nibh tincidunt nec tincidunt nunc pellentesque. Etiam vel arcu sit amet quam auctor tincidunt commodo eu leo. Aliquam in arcu nulla. Donec eget imperdiet dui. Praesent vitae odio leo. Morbi bibendum lobortis sapien sit amet posuere. Nullam blandit, sem et dapibus porttitor, dolor metus pharetra dui, sit amet rhoncus justo nibh at nibh."
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Title
        title = "Terms of Service"
        
        // Setup View
        setupView()
    }

    // MARK: - View Methods
    
    private func setupView() {
        // Configure View
        view.backgroundColor = .white
        
        // Initialize Cancel Button
        let cancelButton = UIButton(type: .system)
        
        // Configure Cancel Button
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.addTarget(self, action: #selector(cancel(_:)), for: .touchUpInside)
        
        // Define Constraints Cancel Button
        view.addSubview(cancelButton)
        cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0).isActive = true

        // Initialize Title Label
        let titleLabel = UILabel(frame: .zero)
        
        // Configure Title Label
        titleLabel.text = title
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        
        // Define Constraints Title Label
        view.addSubview(titleLabel)
        titleLabel.centerYAnchor.constraint(equalTo: cancelButton.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        // Initialize Text View
        let textView = UITextView(frame: .zero)
        
        // Configure Text View
        textView.text = termsOfService
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 15.0, weight: .light)
        
        // Define Constraints Text View
        view.addSubview(textView)
        textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20.0).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20.0).isActive = true
        textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0).isActive = true
    }
    
}
