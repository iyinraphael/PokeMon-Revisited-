//
//  Networking.swift
//  PokeMon Revisited
//
//  Created by Iyin Raphael on 12/9/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import Foundation

class Networking {
    
    let baseURL = URL(string: "http://pokeapi.co/api/v2/pokemon")!
    
    var pokemon: PokeMon?
    var pokemons = [PokeMon]()
    
    func fetchAPI(searchTerm: String, completion: @escaping ([PokeMon]?, Error?) -> Void ) {
        
        guard var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true) else {
            fatalError("Unable to resolve baseURL to components")
        }
        let searchQueryItem = URLQueryItem(name: searchTerm, value: nil)
       
        urlComponents.queryItems = [searchQueryItem]
        
        guard let searchResult = urlComponents.url else {
            NSLog("Error constructing url with \(searchTerm)")
            completion(nil, NSError())
        }
        
        var request = URLRequest(url: searchResult)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
        
            guard error == nil, let data = data else {
                if let error = error {
                    NSLog("Error occured while fetchig data \(error)")
                    completion(nil, NSError())
                }
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let pokemon = try jsonDecoder.decode(PokeMon.self, from: data)
                self.pokemon = pokemon
            } catch {
                NSLog("Unable to decode data into people: \(error)")
                completion(nil,error)
            }
            
        }.resume()
        
    }
    

}
