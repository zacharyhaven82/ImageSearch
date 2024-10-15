//
//  ImageRow.swift
//  ImageSearch
//
//  Created by Zachary Haven on 10/14/24.
//

import SwiftUI

struct ImageRowView: View {
    
    @State var imageRowViewModel: ImageRowViewModel
    
    var body: some View {
        HStack {
            if imageRowViewModel.isLoading {
                ProgressView()
            } else {
                if let data = imageRowViewModel.imageData {
                    Image(data: data)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 35, height: 35)
                        .border(Color.accentColor)
                        .clipped()
                } else {
                    Image(systemName: "questionmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                        .border(Color.accentColor)
                        .clipped()
                }
            }
            Text(imageRowViewModel.title)
        }.task {
            imageRowViewModel.imageData = try? await ImageRequest.makeImageRequest(url: imageRowViewModel.imageLink)
            imageRowViewModel.isLoading = false
        }
    }
}

#Preview {
    ImageRowView(imageRowViewModel: ImageRowViewModel(imageLink: ImageInfo.mockImageInfo.link,
                                                      title: ImageInfo.mockImageInfo.title ?? ""))
}
