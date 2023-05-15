//
//  Profile.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-10.
//

import SwiftUI

struct Profile: View {
    
    var body: some View {
        
        ScrollView {
            VStack{
                Image ("singer2")
                    .resizable()
                    .frame(width: 320, height: 420)
                    .clipShape(Circle())
                
                Text("Marilyn Brown")
                    .font(.title)
                    .bold()
            }
            
            Spacer().frame(height: 30)
            
            VStack(alignment: .leading, spacing: 12){
                HStack {
                    Image(systemName: "envelope")

                    Text("marilyn@mail.se")
                }
                
                HStack{
                    Image(systemName: "phone")
                    Text("+46 7879 765 8")
                }
                
                HStack{
                    Image(systemName: "location.fill")
                    Text("Stockholm, Sweden")
                }
                
            }
            
            Spacer().frame(height: 30)
            
            Button {
                print("Button Tapped")
            } label : {
                Text("Update Profile")
                    .bold()
                    .frame(width: 260, height: 50)
                    .background(Color.yellow)
                    .foregroundColor(.black)
                    .cornerRadius(12)
            }
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
