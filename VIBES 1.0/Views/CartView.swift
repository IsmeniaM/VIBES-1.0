//
//  CartView.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-10.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager : CartManager
    var body: some View {
        ScrollView {
            
            if cartManager.products.count > 0 {
                ForEach(cartManager.products, id: \.id) {
                    product in
                    ProductRow(product: product)
                }
                
                HStack {
                    Text("Your cart total is")
                    Spacer()
                    Text("\(cartManager.total) KR")
                        .bold()
                }
                .padding()
            } else {
                
                Image("empty")
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180, height: 180)
                    .scaledToFit()
                    .padding(.top, 160)
                    
                Text("Your cart is empty ...")
                    .bold()
                    
            }
        }
        .navigationTitle(Text("My cart"))
        .padding(.top)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
