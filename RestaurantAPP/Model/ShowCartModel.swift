//
//  ShowCartModel.swift
//  RestaurantAPP
//
//  Created by Hany Karam on 10/21/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import UIKit

struct ShowCart: Codable {
    let status: Bool?
    let message: String?
    let data: ShowCartDataClass?
}

// MARK: - DataClass
struct ShowCartDataClass: Codable {
    let cartItems: [CartItemDataClass]?
    let subTotal, total: Int?
    
    enum CodingKeys: String, CodingKey {
        case cartItems = "cart_items"
        case subTotal = "sub_total"
        case total
    }
}

// MARK: - CartItem
struct CartItemDataClass: Codable {
    let id, quantity: Int?
    let product: ProductDataClass?
}

// MARK: - Product
struct ProductDataClass: Codable {
    let id, price, oldPrice, discount: Int?
    let image: String?
    let name, productDescription: String?
    let images: [String]?
    let inFavorites, inCart: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, price
        case oldPrice = "old_price"
        case discount, image, name
        case productDescription = "description"
        case images
        case inFavorites = "in_favorites"
        case inCart = "in_cart"
    }
}
