//
//  ImageGallaryRequest.swift
//  ImageSearch
//
//  Created by Zachary Haven on 10/14/24.
//

import Foundation

struct ImageGallaryRequest {
    static func makeImageGallaryRequest(search: String, sort: ImageSort) async throws -> ImageGallaryResponse {
        let urlString = "https://api.imgur.com/3/gallery/search" + sort.urlValue() + "/1?q=\(search)&q_type=jpg" // defaults page to 1
        
        let networkRequest = NetworkRequest(url: urlString, headers: imgurAuthHeaders)
        
        return try await NetworkManager().makeRequest(for: networkRequest)
    }
}
