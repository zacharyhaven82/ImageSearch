//
//  ImageRowViewModel.swift
//  ImageSearch
//
//  Created by Zachary Haven on 10/14/24.
//

import Foundation

@Observable
class ImageRowViewModel {
    
    let defaultImage = "questionmark"
    
    var imageLink: String
    var title: String
    var imageData: Data?
    var isLoading = true
    
    init(imageLink: String, title: String) {
        self.imageLink = imageLink
        self.title = title
    }
    
    func getImage() async {
        imageData = try? await ImageRequest.makeImageRequest(url: imageLink)
    }
}
