//
//  ImageRowViewModel.swift
//  ImageSearch
//
//  Created by Zachary Haven on 10/14/24.
//

import Foundation

@Observable
class ImageRowViewModel {
    
    var imageLink: String
    var imageData: Data?
    var title: String
    var isLoading = true
    
    init(imageLink: String, title: String) {
        self.imageLink = imageLink
        self.title = title
    }
}
