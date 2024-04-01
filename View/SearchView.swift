//
//  SearchView.swift
//  ZigZag
//
//  Created by Navodya Weerasooriya on 2024-04-01.
//

import SwiftUI


struct SearchView: View {
    @State var searchString: String = ""
    @State private var selectedFilterIndex: Int?

    let filterItems = ["T-shirts", "Shorts", "Pants", "Frocks", "Denims"]
    
    // Sample clothing items
    let sampleClothingItems: [ClothingItem] = [
        ClothingItem(name: "T-shirt 1", description: "Description of T-shirt 1", size: ["S", "M", "L"], price: 2000.00, type: "T-shirts", color: "Blue", imageName: "f1", date: Date()),
        ClothingItem(name: "Shorts 1", description: "Description of Shorts 1", size: ["S", "M", "L"], price: 3000.0, type: "Shorts", color: "Black", imageName: "f2", date: Date()),
        ClothingItem(name: "Pants 1", description: "Description of Pants 1", size: ["S", "M", "L"], price: 40000.0, type: "Pants", color: "Gray", imageName: "f3", date: Date()),
        ClothingItem(name: "T-shirt 2", description: "Description of T-shirt 1", size: ["S", "M", "L"], price: 2000.00, type: "T-shirts", color: "Blue", imageName: "f1", date: Date()),
        ClothingItem(name: "Shorts 2", description: "Description of Shorts 1", size: ["S", "M", "L"], price: 3000.0, type: "Shorts", color: "Black", imageName: "f2", date: Date()),
        ClothingItem(name: "Pants 2", description: "Description of Pants 1", size: ["S", "M", "L"], price: 40000.0, type: "Pants", color: "Gray", imageName: "f3", date: Date())
      
    ]
    
    var filteredClothingItems: [ClothingItem] {
        if let selectedFilterIndex = selectedFilterIndex {
            let filter = filterItems[selectedFilterIndex]
            return sampleClothingItems.filter { $0.type == filter }
        } else {
            return sampleClothingItems
        }
    }

    var filteredAndSearchedItems: [ClothingItem] {
        if searchString.isEmpty {
            return filteredClothingItems
        } else {
            return filteredClothingItems.filter {
                $0.name.lowercased().contains(searchString.lowercased()) ||
                $0.description.lowercased().contains(searchString.lowercased())
            }
        }
    }

    var body: some View {
        VStack {
            SearchBar(searchString: $searchString)
            FilterView(filterItems: filterItems, selectedFilterIndex: $selectedFilterIndex)
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                    ForEach(filteredAndSearchedItems) { item in
                        ClothingItemView(item: item)
                    }
                }
                .padding(.vertical)
            }
        }
    }
}

struct ClothingItemView: View {
    let item: ClothingItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Group{
                Text(item.name)
                    .font(.headline)
                Text(item.description)
                    .font(.system(size: 12))
                    .opacity(0.6)
                Text("Rs.\(String(format: "%.2f", item.price))")
                    .font(.system(size: 15))
                    .foregroundColor(.blue)
            }
            .padding(.horizontal,5)
        }
        .background(Color.white)
    }
}

struct SearchBar: View {
    @Binding var searchString: String

    var body: some View {
        HStack {
            TextField("Search...", text: $searchString)
            Spacer()
            Image(systemName: "magnifyingglass")
                .opacity(0.2)
        }
        .padding()
        .background(Color.black.opacity(0.04))
        .cornerRadius(10)
        .padding(.horizontal)
        .padding(.top)
    }
}

struct FilterView: View {
    let filterItems: [String]
    @Binding var selectedFilterIndex: Int?

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(0..<filterItems.count) { index in
                    FilterButton(title: self.filterItems[index],
                                 isSelected: index == self.selectedFilterIndex) {
                        if self.selectedFilterIndex == index {
                            self.selectedFilterIndex = nil
                        } else {
                            self.selectedFilterIndex = index
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 10)
    }
}


struct FilterButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: {
                self.action()
        }) {
            Text(title)
                .font(.system(size: 12))
                .foregroundColor(isSelected ? .white : .black)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(isSelected ? Color.blue : Color.clear)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 1)
                )
        }
    }
}






#Preview {
    SearchView()
}
