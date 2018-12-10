//
//  Model .swift
//  PokeMon Revisited
//
//  Created by Iyin Raphael on 12/9/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import Foundation

class Model {
    
    var pokemon: PokeMon?
    var pokemons = [PokeMon]()
    let networking = Networking()
    
    func add(pokemonName: String) {
        networking.fetchAPI(searchTerm: pokemonName) { (pokemon, error) in
            self.pokemon = pokemon
        }
        guard let pokemon = pokemon else {return}
        pokemons.append(pokemon)
        saveToPersistence()
    }
    
    func pokemon(at index: IndexPath) -> PokeMon {
        return pokemons[index.row]
    }
    
    func numberOfItems() -> Int {
        return pokemons.count
    }
    
    func delete(at index: IndexPath) {
        pokemons.remove(at: index.row)
        saveToPersistence()
    }
    
}
