//
//  CartConcertView.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-15.
//

import SwiftUI

struct CartConcertView: View {
        @EnvironmentObject var cartManager : CartManager
        var body: some View {
            ScrollView {
                
                if cartManager.concerts.count > 0 {
                    ForEach(cartManager.concerts, id: \.id) {
                        concert in
                        ConcertRow(concert: concert)
                    }
                    
                    HStack {
                        Text("Your cart total is")
                        Spacer()
                        Text("\(cartManager.total) KR")
                            .bold()
                    }
                    .padding()
                    
                    PaymentButton(action: {})
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
    


    struct CartConcertView_Previews: PreviewProvider {
        static var previews: some View {
            CartConcertView()
                .environmentObject(CartManager())
        }
    }
