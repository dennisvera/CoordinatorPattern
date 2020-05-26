//
//  PhotosViewModel.swift
//  Photos
//
//  Created by Dennis Vera on 5/26/20.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import Foundation

class PhotosViewModel {
    
    // MARK: - Properties
    
    private lazy var dataSource: [Photo] = [
        Photo(id: "pli", title: "Misery Ridge",                     url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/1.jpg"), price: 25.99),
        Photo(id: "jyg", title: "Grand Teton Sunset",               url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/2.jpg"), price: 15.99),
        Photo(id: "rdz", title: "Orange Icebergs",                  url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/3.jpg"), price: 27.99),
        Photo(id: "aqs", title: "Grand Teton Sunrise",              url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/4.jpg"), price: 35.99),
        Photo(id: "dfc", title: "Milky Tail",                       url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/5.jpg"), price: 18.99),
        Photo(id: "gbh", title: "White Sands National Monument",    url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/6.jpg"), price: 24.99),
        Photo(id: "hnj", title: "Stonehenge Storm",                 url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/7.jpg"), price: 25.99),
        Photo(id: "jkr", title: "Mountain Sunrise",                 url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/8.jpg"), price: 30.99),
        Photo(id: "pah", title: "Colours of Middle Earth",          url: URL(string: "https://cdn.cocoacasts.com/7ba5c3e7df669703cd7f0f0d4cefa5e5947126a8/9.jpg"), price: 50.99)
    ]
    
    var numberOfPhotos: Int {
        return dataSource.count
    }
    
    func photoViewModelForPhoto(at index: Int) -> PhotoViewModel {
        return PhotoViewModel(photo: dataSource[index])
    }
    
}
