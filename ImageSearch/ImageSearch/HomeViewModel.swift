//
//  HomeViewModel.swift
//  ImageSearch
//
//  Created by Zachary Haven on 10/14/24.
//

import Foundation

@Observable
class HomeViewModel {
    
    let viewTitle = "Image Search"
    let placeHolderText = "Search"
    let buttonText = "Search"
    
    var searchText = ""
    var buttonDisabled = true
    var menuViewModel = MenuViewModel()
}
