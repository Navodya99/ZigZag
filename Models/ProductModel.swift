//
//  ProductModel.swift
//  ZigZag
//
//  Created by Navodya Weerasooriya on 2024-04-02.
//

import Foundation

struct ProductModel: Identifiable, Decodable {
    var id: String
    var itemName: String
    var description: String
    var size: String
    var price: Double
    var type: String
    var color: String
    var imageName: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case itemName = "itemName"
        case description = "description"
        case size = "size"
        case price = "price"
        case type = "type"
        case color = "color"
        case imageName = "imageName"
    }
}
