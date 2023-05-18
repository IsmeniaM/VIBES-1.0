//
//  CostumViews.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-12.
//

import SwiftUI

struct CustomViews: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CustomViews_Previews: PreviewProvider {
    static var previews: some View {
        CustomViews()
    }
}

struct CustomTextField: View {
    
    var placeHolder: String
    var imageName: String
    var bColor: String
    var tOpacity: Double
    @Binding var value: String
    
    var body: some View {
        
        HStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.leading, 20)
                .foregroundColor(.black)
            
            if placeHolder == "Password" || placeHolder == "Confirm Password" {
                
                ZStack (alignment: .leading) {
                if value.isEmpty {
                    Text(placeHolder)
                        .foregroundColor(.gray)
                        .padding(.leading, 12)
                        .font(.system(size: 20))
                }
                
                    SecureField("", text: $value)
                        .padding(.leading, 12)
                        .font(.system(size: 20))
                        .frame(height: 45)
                        .foregroundColor(.black)
            }
        }
            else {
                ZStack(alignment: .leading){
                    if value.isEmpty {
                        Text(placeHolder)
                            .foregroundColor(.gray)
                            .padding(.leading, 12)
                            .font(.system(size: 20))
                    }
                    
                    TextField("", text: $value)
                        .padding(.leading, 12)
                        .font(.system(size: 20))
                        .frame(height: 45)
                        .foregroundColor(.black)
                }
            }
        }
        .overlay(
            Divider()
                .overlay(
                    Color(bColor).opacity(tOpacity)
                ).padding(.horizontal, 20),
            alignment: .bottom
        )
    }
}

struct CustomButtonLogIn: View {
    
    var title: String
    var bgColor: String
    
    var body: some View {
        Text("Sign In")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(height:58)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color(bgColor))
            .cornerRadius(15)
        
    }
}

