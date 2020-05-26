//
//  PhotoViewModel.swift
//  Photos
//
//  Created by Dennis Vera on 5/26/20.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import Foundation

struct PhotoViewModel {
    
    let photo: Photo
    
    var title: String {
        return photo.title
    }
    
    var url: URL? {
        return photo.url
    }
    
    var didBuyPhoto: Bool {
        return UserDefaults.didBuy(photo)
    }
}

extension PhotoViewModel: PhotoPresentable {}
