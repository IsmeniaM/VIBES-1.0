//
//  NewsCard.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-15.
//

import SwiftUI

struct NewsCard: View {
    var body: some View {
       
        VStack(alignment: .leading, spacing: 8.0) {
            Image("NEWS")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height:128)
                .frame(maxWidth: .infinity)
            Text("News of this week")
                .font(.subheadline)
                .fontWeight(.light)
                .foregroundColor(Color.gray
                )
                .bold()
                .multilineTextAlignment(.trailing)
                .opacity(0.7)
        }
        .padding(16)
        .frame(width: 252, height: 329)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: .gray, radius: 3, x: 3, y: 3)
    }
}


struct NewsCard_Previews: PreviewProvider {
    static var previews: some View {
        NewsCard()
    }
}
