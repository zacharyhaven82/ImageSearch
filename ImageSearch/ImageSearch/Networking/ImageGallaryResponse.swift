//
//  ImageGallaryResults.swift
//  ImageSearch
//
//  Created by Zachary Haven on 10/14/24.
//

import Foundation

struct ImageGallaryResponse: Codable {
    
    let data: [ImageGallary]?
    
    static let mockImageGallaryResponse = [ImageGallary.mockImageGallary]
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
    
    static let mockImageGallary = ImageGallary(id: "FuzD4ze",
                                               title: "Biscuit’s daily picture",
                                               cover: "8SrYIRQ",
                                               nsfw: false,
                                               images: [ImageInfo.mockImageInfo])
}

struct ImageInfo: Codable, Hashable, Identifiable {
    
    let id: String
    let title: String?
    let link: String
    
    static let mockImageInfo = ImageInfo(id: "8SrYIRQ",
                                         title: nil,
                                         link: "https://i.imgur.com/8SrYIRQ.jpg")
}
