//
//  ImageGallaryResults.swift
//  ImageSearch
//
//  Created by Zachary Haven on 10/14/24.
//

import Foundation

struct ImageGallaryResponse: Codable {
    let data: [ImageGallary]?
}
        
struct ImageGallary: Codable, Hashable, Identifiable {
    let id: String
    let title: String?
    let cover: String?
    let nsfw: Bool?
    let images: [ImageInfo]?
    
    func getCoverImage() -> ImageInfo? {
        return images?.first(where: { $0.id == cover })
    }
}

struct ImageInfo: Codable, Hashable, Identifiable {
    let id: String
    let title: String?
    let link: String
}
