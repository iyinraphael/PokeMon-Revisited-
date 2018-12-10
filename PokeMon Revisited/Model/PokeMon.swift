//
//  PokeMon.swift
//  PokeMon Revisited
//
//  Created by Iyin Raphael on 12/9/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import Foundation
struct PokeMon: Codable {
    
    let name: String
    let id: Int
    let abilities: [Abilities]
    
    struct Abilities: Codable {
        let ability: [Ability]
        
        struct Ability: Codable {
            let name: String
        }
    }
    
    let sprites: [Sprites]
    struct Sprites: Codable {
        let frontDefault: String
    }
    
    let types: [Types]
    struct Types: Codable {
        let type: [SubType]
        struct SubType: Codable {
            let name: String
        }
    }
    
}
