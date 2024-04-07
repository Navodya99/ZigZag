//
//  ZigZagApp.swift
//  ZigZag
//
//  Created by Navodya Weerasooriya on 2024-03-31.
//

import SwiftUI

@main
struct ZigZagApp: App {
    @StateObject var cartViewModel = CartViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cartViewModel)
        }
    }
}
