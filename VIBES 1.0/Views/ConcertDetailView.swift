//
//  ConcertDetailView.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-15.
//

import SwiftUI

struct ConcertDetailView: View {
    @State var concert: Concert
//    @StateObject var cartManager = CartManager()
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ScrollView {
            VStack{
                
                Image(concert.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Join us for an unforgettable concert experience!")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Concert Details:")
                    .font(.headline)
                    .fontWeight(.bold)
                
                    Text("- Artist: \(concert.name)")
                        .bold()
                    Text("- Date: \(concert.date)")
                        .bold()
                    Text("- Venue: \(concert.address)")
                        .bold()
                    Text("- Time: \(concert.time)")
                        .bold()
                
                Text("Tickets are priced at \(concert.price) KR per person, offering you the opportunity to witness the legendary \(concert.name) live on stage. The concert will take place at the prestigious \(concert.address), known for its state-of-the-art facilities and exceptional acoustics.")
                
//                Text("Prepare to be mesmerized by \(concert.name)'s captivating vocals, incredible stage presence, and a setlist featuring her greatest hits and latest chart-toppers. From powerful ballads to high-energy dance tracks, \(concert.name)'s performance promises to be a night to remember.")
                
                Text("Immerse yourself in the electric atmosphere as fans from all around gather to celebrate the music of one of the world's most iconic artists. The concert is expected to be a spectacle of dazzling visuals, stunning costumes, and impressive live production, ensuring a truly immersive experience for all attendees.")
                
                Text("Don't miss out on this opportunity to witness \(concert.name)'s unparalleled talent and enjoy an evening filled with unforgettable music and memories. Grab your tickets now and get ready to be transported into a world of pure musical magic!")
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)
                
                Button(action: {
                    cartManager.addToCart(concert: concert)
                    print("added to cart")
                }) {
                    Text("ADD TO CART")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width, height: 80)
                        .background(Color.black)
                        .cornerRadius(15)
                }
                .padding(.vertical)
                
            }
            .padding()
            .environmentObject(cartManager)
        }
    }
}

struct ConcertDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let concert = Concert(name: "concert-name", date: "10-11-2023", image: "concert-image", time: "10.00", address: "Street Love", price: 350)
        
        //ConcertCard(concert: concerts[0])
        return ConcertDetailView(concert: concert)
            .environmentObject(CartManager())
        
    }
}
