//
//  CartView.swift
//  ZigZag
//
//  Created by Navodya Weerasooriya on 2024-04-07.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var total: Double {
        cartViewModel.cartItems.reduce(0) { $0 + $1.item.price }
    }

    var body: some View {
        VStack {
            HStack{
                Text("Cart Collection")
                Image(systemName: "cart")
                Spacer()

            }
            .font(.system(size: 25))
            .padding()
            .fontWeight(.medium)
            
            List {
                ForEach(cartViewModel.cartItems) { cartItem in
                    VStack {
                        HStack{
                            VStack(alignment : .leading){
                                Text(cartItem.item.itemName)
                                    .fontWeight(.medium)
                                    .font(.system(size: 16))
                                Text("Size \(cartItem.item.size)")
                                    .font(.system(size: 13))
                                    .opacity(0.8)
                                Spacer()
                                Text("LKR \(String(format: "%.2f", cartItem.item.price))")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 16))
                            }
                            .padding(.vertical)
                            Spacer()
                            Image(cartItem.item.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 100)
                                .frame(width: 80)
                                .cornerRadius(20)
                        }
                    }
                    .contextMenu {
                        Button("Remove") {
                            cartViewModel.removeFromCart(cartItem: cartItem)
                        }
                    }
                }

            }
            
            Button("Purchase Now LKR \(String(format: "%.2f", total)) ") {
                // Perform purchase action here
            }
            .foregroundColor(.white)
            .padding()
            .background(Color("SplashBlue"))
            .fontWeight(.semibold)
            .cornerRadius(30)
            .frame(height: 80)

        }
        .navigationTitle("Cart")
    }
}


#Preview {
    CartView().environmentObject(CartViewModel())
}
