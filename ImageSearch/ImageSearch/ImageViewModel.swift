//
//  ImageViewModel.swift
//  ImageSearch
//
//  Created by Zachary Haven on 10/14/24.
//

import Foundation

@Observable
class ImageViewModel {
    
    let loadingText = "Loading"
    let noImagesText = "No Images..."
    let errorText = "Error"
    
    var image: ImageInfo
    var imageData: Data?
    var isLoading = true
    var displayError = false
    
    init(image: ImageInfo) {
        self.image = image
    }
    
    func getImageData() async throws {
        imageData = try await ImageRequest.makeImageRequest(url: image.link)
    }
}
