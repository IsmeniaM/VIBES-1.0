//
//  Home.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-10.
//

import SwiftUI

struct Home: View {
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    var body: some View {
        
        NavigationView{
            ScrollView{
                LazyVGrid<<#Content: View#>>(columns: columns, spacing: 20) {
                    ForEach(productList, id: \.id) { product in
                        ProductCard(product: product)
                        
                    }
                }
                .padding()
            }
            .navigationTitle(Text("STHML VIBES"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
