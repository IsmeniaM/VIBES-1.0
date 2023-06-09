//
//  CartManager.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-10.
//

import Foundation

class CartManager: ObservableObject {
    
    @Published private(set) var concerts: [Concert] = []
    
    @Published private(set) var total: Int = 0
    @Published private(set) var favorites: [Concert] = []

    
    
    func addToCart(concert: Concert) {
    
        if let index = concerts.firstIndex(where: {$0.id == concert.id}) {
            
            concerts[index].quantity += 1
            total += concert.price
        } else {
            
            concerts.append(concert)
            total += concert.price
        }
    }
    
    
    func removeFromCart(concert: Concert) {
        concerts = concerts.filter { $0.id != concert.id }
        total -= concert.price
    }
    
    
    func incrementQuantity(for concert: Concert) {
        if let index = concerts.firstIndex(of: concert) {
            concerts[index].quantity += 1
            total += concert.price
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
    
    
    func addToFavorites(concert: Concert) {
        favorites.append(concert)
    }
    
    func removeFromFavorites(concert: Concert) {
            if let index = favorites.firstIndex(of: concert) {
                favorites.remove(at: index)
            }
        }
    
    func isFavorite(concert: Concert) -> Bool {
            return favorites.contains(concert)
        }
    
    
    
    
    func getQuantity(for concert: Concert) -> Int {
        if let index = concerts.firstIndex(of: concert) {
            return concerts[index].quantity
        }
        return 0
    }
}
