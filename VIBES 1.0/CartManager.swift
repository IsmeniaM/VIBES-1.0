//
//  CartManager.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-10.
//

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var concerts: [Concert] = []
    
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
    
    func addToCart(concert: Concert) {
        //Check if the product already exists in the cart
        if let index = concerts.firstIndex(where: {$0.id == concert.id}) {
            //Increment the quantity of the existing product
            concerts[index].quantity += 1
            total += concert.price
        } else {
            //Add the new product to the cart
            concerts.append(concert)
            total += concert.price
        }
    }
    
    func removeFromCart(product: Product) {
        products = products.filter { $0.id != product.id }
        total -= product.price
    }
    
    func removeFromCart(concert: Concert) {
        concerts = concerts.filter { $0.id != concert.id }
        total -= concert.price
    }
    
    func incrementQuantity(for product: Product) {
        if let index = products.firstIndex(of: product) {
            products[index].quantity += 1
            total += product.price
        }
    }
    
    func incrementQuantity(for concert: Concert) {
        if let index = concerts.firstIndex(of: concert) {
            concerts[index].quantity += 1
            total += concert.price
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
    
    func decrementQuantity(for concert: Concert) {
            if let index = concerts.firstIndex(of: concert) {
                if concerts[index].quantity > 1 {
                    concerts[index].quantity -= 1
                    total -= concert.price
                } else {
                    concerts.remove(at: index)
                    total -= concert.price
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
    
    func getQuantity(for concert: Concert) -> Int {
        if let index = concerts.firstIndex(of: concert) {
            return concerts[index].quantity
        }
        return 0
    }
}
