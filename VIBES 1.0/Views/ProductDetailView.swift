//
//  ProductDetailView.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-11.
//

import SwiftUI

struct ProductDetailView: View {
   @State var product: Product
   @State var isFavorited: Bool = false
   @State var cartManager = CartManager()
    
    var body: some View {
        ScrollView {
            VStack {
                Image(product.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(product.name)
                    .font(.title)
                    .padding(.top)
                Text("\(product.price)KR")
                    .font(.headline)
                    .padding(.top)
                Spacer()
                
                Button(action: {
                                    isFavorited.toggle()
                                }, label: {
                                    Image(systemName: isFavorited ? "heart.fill" : "heart")
                                        .foregroundColor(.red)
                                        .font(.largeTitle)
                                    
                                })
                                .padding(.bottom)
            }
            .navigationBarTitle(Text(product.name), displayMode: .inline)
        }
    }
}


struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let product = Product(name: "Product Name", image: "product-image", price: 999, quantity: 1, isFavorited: false)
        return ProductDetailView(product: product)
            .environmentObject(CartManager())
    }
        
}

