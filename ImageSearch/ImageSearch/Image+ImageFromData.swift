//
//  Image+ImageFromData.swift
//  ImageSearch
//
//  Created by Zachary Haven on 10/14/24.
//

import SwiftUI
import UIKit

extension Image {
    
    init(data: Data) {
        let uiImage: UIImage = UIImage(data: data) ?? UIImage()
        self.init(uiImage: uiImage)
    }
}
