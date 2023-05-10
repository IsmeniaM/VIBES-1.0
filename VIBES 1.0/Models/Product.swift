//
//  Product.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-10.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
}

var productList = [
    Product(name: "Ana", image: "singer1", price: 300),
    Product(name: "AKra", image: "singer2", price: 300),
    Product(name: "Gabriel", image: "singer3", price: 300),
    Product(name: "Johana", image: "singer4", price: 300),
    Product(name: "Ana", image: "singer1", price: 300),
    Product(name: "AKra", image: "singer2", price: 300),
    Product(name: "Gabriel", image: "singer3", price: 300)
]
