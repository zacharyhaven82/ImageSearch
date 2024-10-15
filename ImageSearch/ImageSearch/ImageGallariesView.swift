//
//  ImageGallariesView.swift
//  ImageSearch
//
//  Created by Zachary Haven on 10/14/24.
//

import SwiftUI

struct ImageGallariesView: View {
    
    @State var imageGallariesViewModel: ImageGallariesViewModel
    
    var body: some View {
        NavigationStack {
            if imageGallariesViewModel.loading {
                VStack {
                    ProgressView()
                    Text("Loading \(imageGallariesViewModel.searchTerm)")
                }
                .navigationTitle(imageGallariesViewModel.searchTerm)
            } else if imageGallariesViewModel.imageGallaries.count > 0 {
                List($imageGallariesViewModel.imageGallaries) { imageGallary in
                    NavigationLink {
                        ImageGallaryView(imageGallaryViewModel: ImageGallaryViewModel(imageGallary: imageGallary.wrappedValue))
                    } label: {
                        if let imageLink = imageGallary.wrappedValue.getCoverImage()?.link {
                            ImageRowView(imageRowViewModel: ImageRowViewModel(imageLink: imageLink,
                                                                              title: imageGallary.wrappedValue.title ?? ""))
                        } else {
                            Text(imageGallary.wrappedValue.title ?? "")
                        }
                    }
                }
                .navigationTitle(imageGallariesViewModel.searchTerm)
            } else {
                Text("No Results...")
                .navigationTitle(imageGallariesViewModel.searchTerm)
            }
        }
        .task {
            do {
                try await imageGallariesViewModel.getImageGallaries()
                imageGallariesViewModel.loading = false
            } catch {
                print(error)
            }
        }
        .alert("Error", isPresented: $imageGallariesViewModel.displayError, actions: {})
    }
}

#Preview {
    ImageGallariesView(imageGallariesViewModel: ImageGallariesViewModel(searchTerm: "Cats", imageSort: .time))
}
