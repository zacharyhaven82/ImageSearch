//
//  HomeViewModel.swift
//  ImageSearch
//
//  Created by Zachary Haven on 10/14/24.
//

import Foundation

@Observable
class HomeViewModel {
    
    var searchText = ""
    var buttonDisabled = true
    var menuViewModel = MenuViewModel()
}
