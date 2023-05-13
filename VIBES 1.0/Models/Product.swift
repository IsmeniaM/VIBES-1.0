//
//  Product.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-10.
//

import Foundation

struct Product: Identifiable, Equatable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
    var quantity: Int = 1
    var isFavorited: Bool
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        lhs.id == rhs.id
    }
}

var productList = [
    Product(name: "Margaritha", image: "singer1", price: 300, isFavorited: false),
    Product(name: "AKra", image: "singer2", price: 300, isFavorited: false),
    Product(name: "Gabriel", image: "singer3", price: 300, isFavorited: false),
    Product(name: "Johana", image: "singer4", price: 300, isFavorited: false),
    Product(name: "Ana", image: "singer1", price: 300, isFavorited: false),
    Product(name: "AKra", image: "singer2", price: 300, isFavorited: false),
    Product(name: "Gabriel", image: "singer3", price: 300, isFavorited: false)
]
