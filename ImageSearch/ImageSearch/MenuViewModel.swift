//
//  MenuViewModel.swift
//  ImageSearch
//
//  Created by Zachary Haven on 10/14/24.
//

import Foundation

@Observable
class MenuViewModel {
    
    var imageSort: ImageSort = .time
    var windowMenuDisabled: Bool {
        switch imageSort {
        case .top:
            return true
        default:
            return false
        }
    }
}
