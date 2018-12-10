//
//  controller.swift
//  PokeMon Revisited
//
//  Created by Iyin Raphael on 12/9/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import Foundation

extension Networking {
    
    var pokemonListURL: URL?{
        
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let fileName = "PokeMon Revisited.plist"
        return documentsDirectory.appendingPathComponent(fileName)
    }
    
    func saveToPersistence() {
        
        let plistEncoder = PropertyListEncoder()
        do {
            guard let pokemonList = pokemonListURL else {return}
            let pokemonData = try plistEncoder.encode(pokemons)
            try pokemonData.write(to: pokemonList)
        } catch {
            NSLog("Error occured trying to save \(error.localizedDescription)")
        }
    }
    
    func loadToPersistence () {
        do {
            guard let pokemonList = pokemonListURL else {return}
            let pokemonData = try Data(contentsOf: pokemonList)
            let plistDecoder = PropertyListDecoder()
            let decodedPokemon = try plistDecoder.decode([PokeMon].self, from: pokemonData)
            self.pokemons = decodedPokemon
        } catch {
            NSLog("Error occured trying to load data \(error.localizedDescription)")
        }
    }
    
    
}
