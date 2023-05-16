//
//  Favorites.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-10.
//

import SwiftUI

struct Favorites: View {
    
    var columns = [GridItem(.adaptive(minimum: 260), spacing: 20)]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(concertsList, id: \.id) { concert in
                            ConcertCard(concert: concert)
                        }
                    }
                    .padding()
                }
            }
        }
        
    }
}

struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        Favorites()
    }
}
