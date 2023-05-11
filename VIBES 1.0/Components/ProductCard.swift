//
//  ProductCard.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-10.
//

import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var cartManager : CartManager
    @State var isFavorited: Bool = false
    @State var product: Product
    
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
          ZStack (alignment: .bottom) {
            
            Image(product.image)
                .resizable()
                .cornerRadius(20)
                .frame(width: 180)
                .scaledToFit()
            
              HStack {
                      VStack(alignment: .leading) {
                          Text(product.name)
                              .bold()
                          
                          Text("\(product.price)KR")
                              .font(.caption)
                      }
                      .padding()
                      .frame(width: 180, alignment: .leading)
                      .background(.ultraThinMaterial)
                      .cornerRadius(20)
                  }
                }
                .frame(width: 180, height: 250)
                .shadow(radius: 3)
            
            Button {
                cartManager.addToCart(product: product)
                print("Added to cart!")
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.yellow)
                    .cornerRadius(50)
                    .padding()
            }
        }
    }


struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: productList[0])
            .environmentObject(CartManager())
    }
  }
}
