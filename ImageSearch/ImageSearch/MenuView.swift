//
//  MenuView.swift
//  ImageSearch
//
//  Created by Zachary Haven on 10/14/24.
//

import SwiftUI

struct MenuView: View {
    
    var menuViewModel: MenuViewModel
    
    var body: some View {
        Menu {
            Menu {
                ForEach(ImageSort.allCases, id: \.self) { sort in
                    Button(sort.displayValue()) {
                        menuViewModel.imageSort = sort
                    }
                }
            } label: {
                Label {
                    Text("Sort By: \(menuViewModel.imageSort.displayValue())")
                } icon: {
                    Image(systemName: "arrow.up.arrow.down.square")
                }
            }
            switch menuViewModel.imageSort {
            case .top(let sortWindow):
                Menu {
                    ForEach(SortWindow.allCases, id: \.self) { window in
                        Button(window.displayValue()) {
                            menuViewModel.imageSort = .top(window)
                        }
                    }
                } label: {
                    Label {
                        Text("Timeframe: \(sortWindow.displayValue())")
                    } icon: {
                        Image(systemName: "calendar")
                    }
                }
            default:
                Label {
                    Text("Timeframe: Unneeded")
                } icon: {
                    Image(systemName: "calendar")
                }
            }
        } label: {
            Image(systemName: "line.3.horizontal.decrease.circle")
        }
    }
}

#Preview {
    MenuView(menuViewModel: MenuViewModel())
}
