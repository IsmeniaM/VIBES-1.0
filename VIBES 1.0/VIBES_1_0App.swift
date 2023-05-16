//
//  VIBES_1_0App.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-09.
//

import SwiftUI
import Firebase

@main
struct VIBES_1_0App: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            SplashScreen()
        }
    }
}
