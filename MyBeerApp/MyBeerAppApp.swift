//
//  MyBeerAppApp.swift
//  MyBeerApp
//
//  Created by Radostina Tachova Chergarska on 14/8/23.
//

import SwiftUI

@main
struct MyBeerAppApp: App {
    var body: some Scene {
        @StateObject var beerViewModel = BeerViewModel()
        WindowGroup {
            ContentView(beerViewModel: beerViewModel)
        }
    }
}
