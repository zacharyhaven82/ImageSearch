//
//  ImageGallaryView.swift
//  ImageSearch
//
//  Created by Zachary Haven on 10/14/24.
//

import SwiftUI

struct ImageGallaryView: View {
    
    @State var imageGallaryViewModel: ImageGallaryViewModel
    
    var body: some View {
        NavigationStack {
            if let images = imageGallaryViewModel.imageGallary.images {
                List(images, id: \.self) { image in
                    NavigationLink {
                        ImageView(imageViewModel: ImageViewModel(image: image))
                    } label: {
                        if let title = image.title {
                            Text(title)
                        } else if let index = images.firstIndex(where: { $0 == image}) {
                            Text("Image \(index + 1)")
                        } else {
                            Text("No Title")
                        }
                    }
                }
                .navigationTitle(imageGallaryViewModel.imageGallary.title ?? "")
            } else {
                Text("No Images...")
                    .navigationTitle(imageGallaryViewModel.imageGallary.title ?? "")
            }
        }
    }
}

#Preview {
    ImageGallaryView(imageGallaryViewModel: ImageGallaryViewModel(imageGallary: ImageGallary(id: "hjkl",
                                                                                             title: "Title",
                                                                                             cover: "fghjkl",
                                                                                             nsfw: false,
                                                                                             images: nil)))
}
