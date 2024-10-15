//
//  ImageView.swift
//  ImageSearch
//
//  Created by Zachary Haven on 10/14/24.
//

import SwiftUI

struct ImageView: View {
    
    @State var imageViewModel: ImageViewModel
    
    var body: some View {
        NavigationStack {
            if imageViewModel.isLoading {
                VStack {
                    ProgressView()
                    Text("Loading \(imageViewModel.image.title ?? "")")
                }
            } else {
                if let data = imageViewModel.imageData {
                    Image(data: data)
                        .resizable()
                        .scaledToFit()
                } else {
                    Text("No Image Available...")
                }
            }
        }
        .task {
            do {
                try await imageViewModel.getImageData()
                imageViewModel.isLoading = false
            } catch {
                imageViewModel.displayError = true
            }
        }
        .alert("Error", isPresented: $imageViewModel.displayError, actions: {})
    }
}

#Preview {
    ImageView(imageViewModel: ImageViewModel(image: ImageInfo.mockImageInfo))
}
