//
//  Home.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-10.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var cartManager: CartManager
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack(spacing: 20) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("THIS WEEK ")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Text("IN STHLM")
                                .foregroundColor(Color("yellow"))
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        .padding(.leading)
                        
                        Spacer(minLength: 0)
                        
                        Image("sthlm")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .padding(.horizontal)
                    
                    
                    ScrollView(.horizontal, showsIndicators: true) {
                        LazyHStack(spacing: 20) {
                            ForEach(concertsList, id: \.id) { concert in ConcertCard(concert: concert)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Rest of your code goes here...
                    
                }
                .padding(.vertical)
            }
            .navigationTitle(Text("STHLM VIBES"))
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

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
