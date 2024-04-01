//
//  SearchView.swift
//  ZigZag
//
//  Created by Navodya Weerasooriya on 2024-04-01.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchString : String = ""

    var body: some View {
        ZStack{
            VStack{
                SearchBar(searchString: $searchString)
                FilterView()
                    
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

struct SearchBar: View {
    @Binding var searchString : String

    var body: some View {
        HStack {
            TextField("Search...", text: $searchString)
            Spacer()
            Image(systemName: "magnifyingglass")
                .opacity(0.2)
        }
        .padding(.vertical, 10)
        .padding(.horizontal)
        .background(Color.black.opacity(0.04))
        .cornerRadius(10)
        .padding(.top)
        
    }
}

struct FilterView: View {
    let filterItems = ["T-shirts", "Shorts", "Pants", "Frocks", "Denims"]
    @State private var selectedFilterIndex: Int?

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(0..<filterItems.count) { index in
                    FilterButton(title: self.filterItems[index],
                                 isSelected: index == self.selectedFilterIndex) {
                        self.selectedFilterIndex = index
                    }
                }
            }
        }
        .padding(.top,10)
    }
    
}

struct FilterButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 12))
                .foregroundColor(isSelected ? .white : .black)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(isSelected ? Color("SplashBlue") : Color.clear)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: isSelected ? 0 : 1)
                )
        }
    }
}




#Preview {
    SearchView()
}
