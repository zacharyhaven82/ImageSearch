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
                    Text(menuViewModel.sortByText + " " + menuViewModel.imageSort.displayValue())
                } icon: {
                    Image(systemName: menuViewModel.sortImage)
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
                        Text(menuViewModel.timeframeText + " " + sortWindow.displayValue())
                    } icon: {
                        Image(systemName: menuViewModel.timeframeImage)
                    }
                }
            default:
                Label {
                    Text(menuViewModel.timeframeText + " " + menuViewModel.timeframeUnusedText)
                } icon: {
                    Image(systemName: menuViewModel.timeframeImage)
                }
            }
        } label: {
            Image(systemName: menuViewModel.menuImage)
        }
    }
}

#Preview {
    MenuView(menuViewModel: MenuViewModel())
}
