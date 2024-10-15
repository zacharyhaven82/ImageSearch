//
//  ImageSearchApp.swift
//  ImageSearch
//
//  Created by Zachary Haven on 10/14/24.
//

import SwiftUI

@main
struct ImageSearchApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(homeViewModel: HomeViewModel())
        }
    }
}
