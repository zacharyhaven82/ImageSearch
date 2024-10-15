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
                        ImageRowView(imageRowViewModel: ImageRowViewModel(imageLink: image.link,
                                                                          title: image.title ?? imageGallaryViewModel.noTitleText))
                    }
                }
                .navigationTitle(imageGallaryViewModel.imageGallary.title ?? "")
            } else {
                Text(imageGallaryViewModel.noImagesText)
                    .navigationTitle(imageGallaryViewModel.imageGallary.title ?? "")
            }
        }
    }
}

#Preview {
    ImageGallaryView(imageGallaryViewModel: ImageGallaryViewModel(imageGallary: ImageGallary.mockImageGallary))
}
