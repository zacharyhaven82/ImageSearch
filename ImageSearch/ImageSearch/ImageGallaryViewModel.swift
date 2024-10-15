//
//  ImageGallaryViewModel.swift
//  ImageSearch
//
//  Created by Zachary Haven on 10/14/24.
//

import Foundation

@Observable
class ImageGallaryViewModel {
    
    let noImagesText = "No Images..."
    let noTitleText = "No Title"
    
    var imageGallary: ImageGallary
    
    init(imageGallary: ImageGallary) {
        self.imageGallary = imageGallary
    }
}
