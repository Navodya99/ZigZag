//
//  DetailView.swift
//  ZigZag
//
//  Created by Navodya Weerasooriya on 2024-04-02.
//

import SwiftUI

struct DetailView: View {
    let item: ProductModel
    @EnvironmentObject var cartViewModel: CartViewModel
    @State private var isNavigationActive = false
    
    var body: some View {
        NavigationStack{
            VStack{
                VStack(alignment: .leading){
                    ZStack{
                        Image(item.imageName)
                            .resizable()
                            .scaledToFit()
                    }
                    HStack{
                        Spacer()
                        Text("SIZE \(item.size)")
                            .padding(.trailing,20)
                            .foregroundStyle(Color.white)
                            .fontWeight(.semibold)
                            .frame(height: 36)
                            .padding(.horizontal)
                            .background(Color("SplashBlue"))
                            .cornerRadius(20)
                            .padding(.top, -28)
                            .padding(.trailing,-20)
                    }
                    
                    Text(item.itemName)
                        .font(.title)
                        .padding(.horizontal,10)
                    Text(item.description)
                        .font(.system(size: 15))
                        .padding(.horizontal,10)
                        .opacity(0.7)
                }
                Spacer()
                Button(action: {
                    cartViewModel.addToCart(item: item)
                }) {
                    HStack {
                        Text("ADD TO CART")
                            .fontWeight(.medium)
                        Spacer()
                        Text("LKR \(String(format: "%.2f", item.price))")
                            .fontWeight(.medium)
                            .opacity(0.8)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color("AppBlack"))
                    .cornerRadius(5)
                    .padding()
                }
            }
        }
    }
}

#Preview {
    DetailView(item: ProductModel(id: "1", itemName: "Sample Item", description: "Sample Description", size: "L", price: 100.0, type: "Shirt", color: "Blue", imageName: "sample_image"))
}
