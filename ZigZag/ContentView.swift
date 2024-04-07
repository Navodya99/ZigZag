//
//  ContentView.swift
//  ZigZag
//
//  Created by Navodya Weerasooriya on 2024-03-31.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSplash = true
    @State private var isLoggedIn = false
    
    var body: some View {
        ZStack {
            if isLoggedIn {
                TabView {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }
                    SearchView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                    CartView()
                        .tabItem {
                            Image(systemName: "cart")
                            Text("Cart")
                        }
                    ProfileView()
                        .tabItem {
                            Image(systemName: "person")
                            Text("Profile")
                        }
                }
                .tint(Color("SplashBlue"))
                .opacity(showingSplash ? 0 : 1)
            } else {
                SignInView {_ in
                    isLoggedIn = true
                }
            }
            
            if showingSplash {
                SplashView()
                    .edgesIgnoringSafeArea(.all)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() +  3) {
                            withAnimation {
                                self.showingSplash = false
                            }
                        }
                    }
            }
        }
    }
}






#Preview {
    ContentView()
}
