//
//  PhotoPresentable.swift
//  Photos
//
//  Created by Bart Jacobs on 28/08/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import Foundation

protocol PhotoPresentable {
    
    // MARK: - Properties
    
    var title: String { get }
    var url: URL? { get }
    
    // MARK: -
    
    var didBuyPhoto: Bool { get }
    
}
