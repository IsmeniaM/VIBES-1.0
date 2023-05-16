//
//  SignUpView.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-12.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var email: String = ""
    @State private var cpassword: String = ""
    @State var isLinkActive = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    @Environment(\.presentationMode) var presentationMode
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if  error != nil {
                // Handle sign-in error
                print("Sign-in error: \(error!.localizedDescription)")
            } else {
                // Sign-in successful
                print("Sign-in successful")
                // Perform any necessary actions after successful sign-in
            }
        }
    
    if !email.isValidEmail() {
                alertMessage = "Invalid email format."
                showAlert = true
                return
            }
            
            if password.count < 6 {
                alertMessage = "Password should be at least 6 characters long."
                showAlert = true
                return
            }
            
            if password != cpassword {
                alertMessage = "Passwords do not match."
                showAlert = true
                return
            }
    
    
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        // Handle sign-in error
                        alertMessage = error.localizedDescription
                        showAlert = true
                    } else {
                        // Sign-in successful
                        alertMessage = "Account created successfully."
                        showAlert = true
                        presentationMode.wrappedValue.dismiss()
                }
            }
        }
    
    var body: some View {
                NavigationView {
                    ZStack(alignment: .topLeading){
                        Color("color1").ignoresSafeArea()
                        VStack{
                            VStack(spacing: 40){
                                ZStack{
                                    Ellipse()
                                        .frame(width: 458, height: 420)
                                        .padding(.leading, -200)
                                        .foregroundColor(Color("yellow"))
                                        .padding(.top, -200)
                                    
                                    Ellipse()
                                        .frame(width: 310, height: 310)
                                        .padding(.trailing, -100)
                                        .foregroundColor(Color("brown"))
                                        .padding(.top, -400)
                                    
                                    Text("Create \nAccount")
                                        .foregroundColor(.white)
                                        .font(.system(size: 35))
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.leading)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 20)
                                        .padding(.top, -100)

                                }
                                
                                VStack(spacing: 20) {
                                    
                                    VStack (spacing: 30) {
                                        CustomTextField(placeHolder: "Name", imageName: "person", bColor: "textColor2", tOpacity: 1.0, value: $name)
                                        
                                        CustomTextField(placeHolder: "Email", imageName: "envelope", bColor: "textColor2", tOpacity: 1.0, value: $email)
                                        
                                        CustomTextField(placeHolder: "Password", imageName: "lock", bColor: "textColor2", tOpacity: 1.0, value: $password)
                                        
                                        CustomTextField(placeHolder: "Confirm Password", imageName: "lock", bColor: "textColor2", tOpacity: 1.0, value: $cpassword)
                                    }
                                    .alert(isPresented: $showAlert) {
                                        Alert(
                                            title: Text("Attention!"),
                                            message: Text(alertMessage),
                                            dismissButton: .default(Text("OK"))
                                        )
                                    }
                                    
                                    VStack  {
                                        
                                        Button (action: {
                                            register()
                                        }, label: {
                                            CustomButtonLogIn(title: "SIGN UP", bgColor: "bColor")
                                    })
                                            .padding(.horizontal, 20)
                                    }
                                }
                                
                                Spacer()
                                
                                HStack {
                                    Text("Already have an account?")
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                        .font(.system(size: 18))
                                    
                                    NavigationLink (destination: LogInView(), isActive: $isLinkActive) {
                                    
                                    Button(action: {
                                        self.isLinkActive = true
                                    }, label: {
                                        Text("Sign In")
                                            .font(.system(size: 18))
                                            .foregroundColor(Color("textColor2"))
                                            .fontWeight(.bold)
                                       })
                                    }
                                }
                                .frame(width:600, height: 63)
                                .frame(minWidth: 0, maxHeight: .infinity)
                                .background(Color("yellow"))
                                .ignoresSafeArea()
                            }
                            
                        }
                    }
                    .edgesIgnoringSafeArea(.bottom)
                }
                .navigationBarHidden(true)
            }
}




struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
