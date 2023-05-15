//
//  ConcertCard.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-14.
//

import SwiftUI

struct ConcertCard: View {
    @State var concert: Concert
    @EnvironmentObject var cartManager : CartManager
    
    var body: some View {
        NavigationLink (destination: ConcertDetailView(concert: concert)) {
            ZStack(alignment: .topTrailing) {
              ZStack (alignment: .bottom) {
                
                Image(concert.image)
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 380, height: 200)
                    .scaledToFit()
                 
                  HStack {
                          VStack(alignment: .leading) {
                             
                             Text(concert.name)
                                      .font(.title3)
                                      .bold()
                          
                          .padding()
                          .frame(width: 380, height: 50)
                          .background(.ultraThinMaterial)
                          .cornerRadius(20)
                      }
                    }
                 
                  Button {
                      cartManager.addToCart(concert: concert)
                      print("Add to cart")
                  } label : {
                     
                      Image(systemName: "plus")
                          .padding()
                          .foregroundColor(.white)
                          .background(.black)
                          .cornerRadius(50)
                          .padding(.bottom, 140 )
                          
                  }
                }
            }
        }
    }
}

struct ConcertCard_Previews: PreviewProvider {
    static var previews: some View {
        ConcertCard(concert: concertsList[0])
    }
}
