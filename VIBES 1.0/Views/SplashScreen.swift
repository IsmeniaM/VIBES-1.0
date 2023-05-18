//
//  SplashScreen.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-09.
//

import SwiftUI

struct SplashScreen: View {
    @State var isActive : Bool = false
        @State private var size = 0.8
        @State private var opacity = 0.5
        
        var body: some View {
            if isActive {
                LogInView()
            } else {
                VStack {
                    VStack {
                        Image("sthlm")                   
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.00
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }


struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
