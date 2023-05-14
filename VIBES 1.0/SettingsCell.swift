//
//  SettingsCell.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-14.
//

import SwiftUI

struct SettingsCell: View {
    
    var settingsTitle: String
    var imgName: String
    var clr: Color
    
    var body: some View {
        HStack {
            
            Image(systemName: imgName)
                .font(.headline)
                .accentColor(.yellow)
            
            Text(settingsTitle)
                .font(.headline)
                .padding(.leading, 10)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.headline)
                .foregroundColor(clr)
        }
    }
}

struct SettingsCell_Previews: PreviewProvider {
    static var previews: some View {
        SettingsCell(settingsTitle: "Features", imgName: "sparks", clr: .purple)
    }
}
