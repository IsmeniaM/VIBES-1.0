//
//  Settings.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-10.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        
        NavigationView {
            
            List {
                Section {
                    Button (action: {
                        self.showFeatures()
                    }) {
                        SettingsCell(settingsTitle: "Features", imgName: "sparkles", clr: .yellow)
                    }
                }
                
                Section {
                    Button (action: {
                        self.showFeatures()
                    }) {
                        SettingsCell(settingsTitle: "Write a Review", imgName: "pencil.and.outline", clr: .yellow)
                    }
                    
                    Button (action: {
                        self.showFeatures()
                    }) {
                        SettingsCell(settingsTitle: "Tell your Friends", imgName: "gift", clr: .yellow)
                    }
                }
                
                Section {
                    Button (action: {
                        self.showFeatures()
                    }) {
                        SettingsCell(settingsTitle: "Suggest a feature", imgName: "star.circle", clr: .yellow)
                    }
                    
                    Button (action: {
                        self.showFeatures()
                    }) {
                        SettingsCell(settingsTitle: "Report a bug", imgName: "exclamationmark.triangle", clr: .yellow)
                    }
                }

            }
            .navigationBarTitle("Settings")
        }
    }
    
    func showFeatures() {
        print("Show user Features")
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
