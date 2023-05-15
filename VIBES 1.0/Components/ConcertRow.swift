//
//  ConcertRow.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-15.
//

import SwiftUI

struct ConcertRow: View {
    @EnvironmentObject var cartManager : CartManager
    var concert: Concert
    
    var body: some View {
        HStack (spacing: 20) {
            Image(concert.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(concert.name)
                    .bold()
                
                Text("\(concert.price) KR")
            }
            
            Spacer()
            
            Button(action: {
                cartManager.incrementQuantity(for: concert)
            }) {
                Image(systemName: "plus.circle")
                    .foregroundColor(.green)
            }
            
            Text("\(cartManager.getQuantity(for: concert))")
                .padding(.horizontal, 5)
            
            Button(action: {
                cartManager.decrementQuantity(for: concert)
            }) {
                Image(systemName: "minus.circle")
                    .foregroundColor(.red)
            }
            
            Image(systemName: "trash")
                .foregroundColor(.red)
                .onTapGesture {
                    cartManager.removeFromCart(concert: concert)
                }
            
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ConcertRow_Previews: PreviewProvider {
    static var previews: some View {
        ConcertRow(concert: concerts[3])
            .environmentObject(CartManager())
    }
}
