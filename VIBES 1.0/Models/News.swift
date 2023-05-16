//
//  News.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-16.
//

import SwiftUI

struct News: Identifiable, Equatable {
    var id = UUID()
    var newtitle: String
    var subtitle: String
    var date: String
}

let newsList = [
    News(newtitle: "News 1", subtitle: "subtitle", date: "22-03-2022"),
    
    News(newtitle: "News 2", subtitle: "subtitle", date: "22-03-2022"),
    
    News(newtitle: "News 3", subtitle: "subtitle", date: "22-03-2022"),
    
    News(newtitle: "News 4", subtitle: "subtitle", date: "22-03-2022")

]
