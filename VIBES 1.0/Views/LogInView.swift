//
//  LogInView.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-12.
//

import SwiftUI

struct LogInView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading){
                VStack{
                    VStack(spacing: 40){
                        ZStack{
                            Ellipse()
                                .frame(width: 410, height: 378)
                                .padding(.leading, -200)
                                .foregroundColor(Color("yellow"))
                                .padding(.top, -200)
                            
                            Ellipse()
                                .frame(width: 310, height: 310)
                                .padding(.trailing, -100)
                                .foregroundColor(Color("brown"))
                                .padding(.top, -400)
                            
                            Text("Welcome \nBack")
                                .foregroundColor(.white)
                                .font(.system(size: 35))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 40)

                        }
                        
                        VStack(spacing: 30) {
                            
                            VStack (spacing: 30) {
                                CustomTextField(placeHolder: "Email", imageName: "envelope", bColor: "bColor", tOpacity: 0.6, value: $email)
                                
                                CustomTextField(placeHolder: "Password", imageName: "lock", bColor: "bColor", tOpacity: 0.6, value: $password)
                            }
                            
                            VStack {
                                Text("Forgot Password")
                                    .fontWeight(.medium)
                                
                                Button (action: {}, label: {
                                    CustomButtonLogIn(title: "SIGN IN", bgColor: "bColor")
                            })
                                    .padding(.horizontal, 20)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
