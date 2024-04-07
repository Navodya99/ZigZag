//
//  CartViewModel.swift
//  ZigZag
//
//  Created by Navodya Weerasooriya on 2024-04-07.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var cartItems = [CartItem]()

    func addToCart(item: ProductModel) {
        let cartItem = CartItem(id: UUID().uuidString, item: item)
        cartItems.append(cartItem)
    }

    func removeFromCart(cartItem: CartItem) {
        if let index = cartItems.firstIndex(where: { $0.id == cartItem.id }) {
            cartItems.remove(at: index)
        }
    }
    
    func removeAllFromCart() {
            cartItems.removeAll()
        
    }
}
