//
//  ProductRow.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-10.
//

import SwiftUI

struct ProductRow: View {
    @EnvironmentObject var cartManager : CartManager
    var product: Product
    
    var body: some View {
        HStack (spacing: 20) {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name)
                    .bold()
                
                Text("\(product.price) KR")
            }
            
            Spacer()
            
            Button(action: {
                cartManager.incrementQuantity(for: product)
            }) {
                Image(systemName: "plus.circle")
                    .foregroundColor(.green)
            }
            
            Text("\(cartManager.getQuantity(for: product))")
                .padding(.horizontal, 5)
            
            Button(action: {
                cartManager.decrementQuantity(for: product)
            }) {
                Image(systemName: "minus.circle")
                    .foregroundColor(.red)
            }
            
            Image(systemName: "trash")
                .foregroundColor(.red)
                .onTapGesture {
                    cartManager.removeFromCart(product: product)
                }
            
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: productList[3])
            .environmentObject(CartManager())
    }
}
