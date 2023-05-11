//
//  CartManager.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-10.
//

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Int = 0
    @Published private(set) var favorites: [Product] = []

    
    func addToCart(product: Product) {
        //Check if the product already exists in the cart
        if let index = products.firstIndex(where: {$0.id == product.id}) {
            //Increment the quantity of the existing product
            products[index].quantity += 1
            total += product.price
        } else {
            //Add the new product to the cart
            products.append(product)
            total += product.price
        }
    }
    
    func removeFromCart(product: Product) {
        products = products.filter { $0.id != product.id }
        total -= product.price
    }
    
    func incrementQuantity(for product: Product) {
        if let index = products.firstIndex(of: product) {
            products[index].quantity += 1
            total += product.price
        }
    }
    
    func decrementQuantity(for product: Product) {
            if let index = products.firstIndex(of: product) {
                if products[index].quantity > 1 {
                    products[index].quantity -= 1
                    total -= product.price
                } else {
                    products.remove(at: index)
                    total -= product.price
                }
            }
      }
    
    func addFavorites(product: Product) {
        if !favorites.contains(product) {
            favorites.append(product)
        }
    }
    
    func removeFromFavorites(product: Product) {
        if let index = favorites.firstIndex(of: product) {
            favorites.remove(at: index)
            print("removed from the fav")
        }
    }
    
    func getQuantity(for product: Product) -> Int {
        if let index = products.firstIndex(of: product) {
            return products[index].quantity
        }
        return 0
    }
}
