//
//  Concerts.swift
//  VIBES 1.0
//
//  Created by Ismenia Brandao on 2023-05-14.
//

import SwiftUI

struct Concert: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let date: String
    let image: String
    let time: String
    let address: String
    let price: Int
    var quantity: Int = 1
    
    
}

let concerts = [
    Concert(name: "Scenkursföreställning", date: "20/05/2023", image: "event1", time: "19:00", address: "Birger Jarlsgatan 70", price: 350),
    
    Concert(name: "Svartklubben - Mat & Musik i Mörker", date: "16/05/2023", image: "event2", time: "19:00", address: "Birger Jarlsgatan 70", price: 350),
    
    Concert(name: "Giveon", date: "16/05/2023", image: "event3", time: "18:00", address: "Cirkus Arena och Restaurang på Djurgården", price: 350),
    
    Concert(name: "NUET - Mind Against & Marino Canal", date: "17/05/2023", image: "event4", time: "18:00", address: "Cirkus", price: 350),
    
    Concert(name: "Steve Hackett", date: "18/05/2023", image: "event5", time: "18:00", address: "Cirkus", price: 350),
    
    Concert(name: "Svartklubben - Mat & Musik i Mörker", date: "18/05/2023", image: "event2", time: "18:00", address: "Birger Jarlsgatan 70", price: 350),
    
    Concert(name: "HAIR - Musikalen", date: "18/05/2023", image: "event6", time: "18:00", address: "Cirkus", price: 350),
    
    Concert(name: "CLUB AFTER DARK", date: "19/05/2023", image: "event7", time: "18:00", address: "Vasateatern", price: 350),
    
    Concert(name: "MAFFIA COMEDY SUPERWEEKEND", date: "19/05/2023", image: "event8", time: "18:00", address: "Scandic Malmen", price: 350),
    
    Concert(name: "Fredrik ”Benke” Rydman – Master Of Dance", date: "19/05/2023", image: "event9", time: "18:00", address: "Elverket, Linnégatan 69", price: 350),
    
    Concert(name: "Andreas Lundstedt – Freedom", date: "19/05/2023", image: "event10", time: "18:00", address: "Cirkus", price: 350)
    
]
