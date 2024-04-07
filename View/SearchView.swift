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
    @ObservedObject var viewModel = ProductViewModel() // Add ViewModel here
    
    let filterItems = ["Dress", "T-Shirt", "Top", "Pants", "Frocks", "Denims"]
    
    var filteredClothingItems: [ProductModel] {
        if let selectedFilterIndex = selectedFilterIndex {
            let filter = filterItems[selectedFilterIndex]
            return viewModel.clothingItems.filter { $0.type == filter } // Use data from ViewModel
        } else {
            return viewModel.clothingItems // Use data from ViewModel
        }
    }
    
    var filteredAndSearchedItems: [ProductModel] {
        if searchString.isEmpty {
            return filteredClothingItems
        } else {
            return filteredClothingItems.filter {
                $0.itemName.lowercased().contains(searchString.lowercased()) ||
                $0.description.lowercased().contains(searchString.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationStack{
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
            .onAppear {
                viewModel.fetchData() // Fetch data when the view appears
            }
        }
        .tint(.black)
    }
    
}


struct ClothingItemView: View {
    let item: ProductModel
    
    var body: some View {
        NavigationLink(destination: DetailView(item: item)) {
            
            VStack(alignment: .leading) {
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                VStack(alignment : .leading){
                        Text(item.itemName)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        Text("Size \(item.size)")
                            .font(.system(size: 15))

                        Text("Rs.\(String(format: "%.2f", item.price))")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)

                    
                }
                .padding(.horizontal,10)
                .frame(height: 100)
                
                
            }
            .background(Color.white)
        }
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
                .background(isSelected ? Color("SplashBlue") : Color("CoupenColor") )
                .cornerRadius(20)
                
        }
    }
}






#Preview {
    SearchView()
}
