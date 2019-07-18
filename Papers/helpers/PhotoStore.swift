//
//  PhotoStore.swift
//  Papers
//
//  Created by Don Bytyqi on 7/18/19.
//  Copyright © 2019 Don Bytyqi. All rights reserved.
//

import SwiftUI
import Combine

class PhotoStore: BindableObject {
    
    let willChange = PassthroughSubject<PhotoStore, Never>()

    var photos: [Photo] = []
    var page: Int = 1
    
    func fetch() {
        UnsplashAPIService.getPhotos(page: page) { (fetchedPhotos) in
            DispatchQueue.main.async {
                self.willChange.send(self)
                self.photos = fetchedPhotos
            }
        }
    }
    
    func fetchMore() {
        page += 1
        var newPhotos = photos
        UnsplashAPIService.getPhotos(page: page) { (fetchedPhotos) in
            DispatchQueue.main.async {
                self.willChange.send(self)
                fetchedPhotos.forEach({
                    if !newPhotos.contains($0) {
                        newPhotos.append($0)
                    }
                })
                self.photos = newPhotos
            }
        }
    }
    
}
