//
//  MenuViewModel.swift
//  ImageSearch
//
//  Created by Zachary Haven on 10/14/24.
//

import Foundation

@Observable
class MenuViewModel {
    
    let sortByText = "Sort By:"
    let sortImage = "arrow.up.arrow.down.square"
    let timeframeText = "Timeframe:"
    let timeframeImage = "calendar"
    let timeframeUnusedText = "Unneeded"
    let menuImage = "line.3.horizontal.decrease.circle"
    
    var imageSort: ImageSort = .time
}
