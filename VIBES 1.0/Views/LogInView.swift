//
//  LogInView.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-12.
//

import SwiftUI
import Firebase

struct LogInView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State private var isLinkActive: Bool = false
    @State private var isLoggedIn: Bool = false
    @State private var showInvalidCredentialsAlert: Bool = false
    @State private var alertMessage = ""
    @State private var showAlert : Bool = false
    
    var body: some View {
        NavigationView {
            if isLoggedIn {
                ContentView()
            } else {
                ZStack(alignment: .topLeading) {
                    VStack {
                        VStack(spacing: 40) {
                            ZStack {
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
                                VStack(spacing: 30) {
                                    CustomTextField(placeHolder: "Email", imageName: "envelope", bColor: "bColor", tOpacity: 0.6, value: $email)
                                    
                                    CustomTextField(placeHolder: "Password", imageName: "lock", bColor: "bColor", tOpacity: 0.6, value: $password)
                                }
                                
                                VStack {
                                    Text("Forgot Password")
                                        .fontWeight(.medium)
                                    
                                    Button(action: {
                                        if validateCredentials() {
                                            login()
                                        } else {
                                            showInvalidCredentialsAlert = true
                                        }
                                    }, label: {
                                        CustomButtonLogIn(title: "SIGN IN", bgColor: "bColor")
                                    })
                                    .padding(.horizontal, 20)
                                }
                            }
                            
                            Spacer()
                            
                            HStack {
                                Text("Don't have an account?")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .font(.system(size: 18))
                                
                                NavigationLink(destination: SignUpView(), isActive: $isLinkActive) {
                                    Text("Sign Up")
                                        .font(.system(size: 18))
                                        .foregroundColor(Color("brown"))
                                        .fontWeight(.bold)
                                }
                                .isDetailLink(false) 
                            }
                            .frame(height: 63)
                            .frame(minWidth: 0, maxHeight: .infinity)
                            .ignoresSafeArea(.all, edges: .bottom)
                        }
                    }
                }
                .alert(isPresented: $showInvalidCredentialsAlert) {
                    Alert(
                        title: Text("Invalid Credentials"),
                        message: Text("Please enter a valid email and password."),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    func validateCredentials() -> Bool {
        // Perform your validation logic here
        return !email.isEmpty && !password.isEmpty
    }
    
    func login() {
        if !email.isValidEmail() {
            alertMessage = "Invalid email format."
            showAlert = true
            return
        }
        
        // Perform login logic here
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                isLoggedIn = true
            }
        }
    }
}

extension String {
       func isValidEmail() -> Bool {
           let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
           return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
       }
}
    

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}

