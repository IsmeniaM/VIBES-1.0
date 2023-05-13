//
//  Home.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-10.
//

import SwiftUI

struct Home: View {
    @StateObject var cartManager = CartManager()
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    var body: some View {
        
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(productList, id: \.id) { product in
                        ProductCard(product: product)
                            .environmentObject(cartManager)
                        
                    }
                }
                .padding()
            }
            .navigationTitle(Text("STHML VIBES"))
            .toolbar {
                NavigationLink {
                    CartView()
                        .environmentObject(cartManager)
                } label: {
                    CartButton(numberOfProducts: cartManager.products.count)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
