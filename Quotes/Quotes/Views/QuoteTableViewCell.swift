//
//  QuoteTableViewCell.swift
//  Quotes
//
//  Created by Bart Jacobs on 30/05/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit

class QuoteTableViewCell: UITableViewCell {

    // MARK: - Type Properties
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }

    // MARK: - Properties
    
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    
    // MARK: - Helper Methods

    func configure(author: String, content: String) {
        // Configure Labels
        authorLabel.text = author
        contentLabel.text = content
        
        // Update Font Content Label
        contentLabel.font = UIFont.systemFont(ofSize: CGFloat(UserDefaults.fontSize),
                                              weight: UserDefaults.fontWeight.toFontWeight)
    }

}
