//
//  Search.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-10.
//

import SwiftUI

struct Search: View {
    @EnvironmentObject var cartManager: CartManager
    
    var columns = [GridItem(.adaptive(minimum: 260), spacing: 20)]
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(concertsList, id: \.id) { concert in
                        ConcertCard(concert: concert)
                        
                    }
                }
                .padding()
            }
            .navigationTitle(Text("All Events This Month"))
            .toolbar {
                NavigationLink {
                    CartConcertView()
                        .environmentObject(cartManager)
                } label: {
                    CartConcertButton(numberOfProducts: cartManager.concerts.count)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(cartManager)
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
