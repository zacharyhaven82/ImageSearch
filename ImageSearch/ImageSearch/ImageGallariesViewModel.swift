//
//  ImageGallariesViewModel.swift
//  ImageSearch
//
//  Created by Zachary Haven on 10/14/24.
//

import Foundation

@Observable
class ImageGallariesViewModel {
    
    let loadingText = "Loading"
    let noResultsText = "No Results..."
    let errorText = "Error"
    
    var searchTerm: String
    var imageSort: ImageSort
    var imageGallaries = [ImageGallary]()
    var loading = true
    var displayError = false
    
    init(searchTerm: String, imageSort: ImageSort) {
        self.searchTerm = searchTerm
        self.imageSort = imageSort
    }
    
    func getImageGallaries() async throws {
        imageGallaries = try await ImageGallaryRequest.makeImageGallaryRequest(search: searchTerm,
                                                                               sort: imageSort).data?.filter({ $0.nsfw == false }) ?? [ImageGallary]()
    }
}
