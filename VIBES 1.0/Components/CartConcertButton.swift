//
//  CartConcertButton.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-15.
//

import SwiftUI

struct CartConcertButton: View {
    var numberOfProducts: Int
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            Image(systemName: "cart")
                .padding(.top, 5)
            
            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .font(.caption2).bold()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .background(.red)
                    .cornerRadius(50)
            }
        }
    }
}

struct CartConcertButton_Previews: PreviewProvider {
    static var previews: some View {
        CartConcertButton(numberOfProducts: 1)
    }
}

