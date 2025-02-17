//
//  HomeView.swift
//  ImageSearch
//
//  Created by Zachary Haven on 10/14/24.
//

import SwiftUI

struct HomeView: View {
    
    @State var homeViewModel: HomeViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField(homeViewModel.placeHolderText, text: $homeViewModel.searchText)
                        .textFieldStyle(.roundedBorder)
                        .onChange(of: homeViewModel.searchText) { oldValue, newValue in
                                homeViewModel.buttonDisabled = newValue.isEmpty
                            }
                    MenuView(menuViewModel: homeViewModel.menuViewModel)
                }
                NavigationLink {
                    ImageGallariesView(imageGallariesViewModel: ImageGallariesViewModel(searchTerm: homeViewModel.searchText,
                                                                                        imageSort: homeViewModel.menuViewModel.imageSort))
                } label: {
                    Text(homeViewModel.buttonText)
                }
                .buttonStyle(.borderedProminent).disabled(homeViewModel.buttonDisabled)
                .padding()
                Spacer()
            }
            .navigationTitle(homeViewModel.viewTitle)
            .padding()
        }
    }
}

#Preview {
    HomeView(homeViewModel: HomeViewModel())
}
