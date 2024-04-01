//
//  ProductModel.swift
//  ZigZag
//
//  Created by Navodya Weerasooriya on 2024-04-02.
//

import Foundation

struct ClothingItem: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var size: [String]
    var price: Double
    var type: String
    var color: String
    var imageName: String
    var date: Date
}
