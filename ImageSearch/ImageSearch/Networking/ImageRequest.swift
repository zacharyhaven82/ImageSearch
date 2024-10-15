//
//  ImageRequest.swift
//  ImageSearch
//
//  Created by Zachary Haven on 10/14/24.
//

import Foundation

struct ImageRequest {
    
    static func makeImageRequest(url: String) async throws -> Data {
        return try await NetworkManager().makeImageRequest(for: NetworkRequest(url: url, headers: imgurAuthHeaders))
    }
}
