//
//  PhotoPresentable.swift
//  Photos
//
//  Created by Dennis Vera on 5/26/20.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import Foundation

protocol PhotoPresentable {
    
    var title: String { get }
    
    var url: URL? { get }
    
    var didBuyPhoto: Bool { get }
}
