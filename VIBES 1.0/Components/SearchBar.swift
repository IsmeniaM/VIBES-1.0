//
//  SearchBar.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-16.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(18)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .disableAutocorrection(true)
            
            Button(action: {
                text = ""
            }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
            }
        }
    }
}


struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
