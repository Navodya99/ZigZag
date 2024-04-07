//
//  CartView.swift
//  ZigZag
//
//  Created by Navodya Weerasooriya on 2024-04-07.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartViewModel: CartViewModel

    var body: some View {
        VStack {
            List {
                ForEach(cartViewModel.cartItems) { cartItem in
                    VStack {
                        Text(cartItem.item.itemName)
                        Text("LKR \(String(format: "%.2f", cartItem.item.price))")
                    }
                    .contextMenu {
                        Button("Remove") {
                            cartViewModel.removeFromCart(cartItem: cartItem)
                        }
                    }
                }
            }
        }
        .navigationTitle("Cart")
    }
}
