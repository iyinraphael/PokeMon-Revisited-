//
//  SearchViewController.swift
//  PokeMon Revisited
//
//  Created by Iyin Raphael on 12/9/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    var pokemon: PokeMon?{
        didSet {
            updateView()
        }
    }
    let network = Networking()
    var model: Model?
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
         guard let pokemon = searchBar.text, !pokemon.isEmpty else {return}
        network.fetchAPI(searchTerm: pokemon) { (pokemon, error) in
            self.pokemon = pokemon
            
            DispatchQueue.main.async {
                self.updateView()
            }
        }
    }
    
    @IBAction func save(_ sender: Any) {
        guard let pokemon = pokemon else {return}
        model?.add(pokemon: pokemon)
    }
    
    func updateView() {
    
        guard let pokemon = pokemon else {return}
        
        nameLabel.text = pokemon.name
        idLabel.text = String(pokemon.id)
        typeLabel.text = pokemon.types[0].type[0].name
        abilitiesLabel.text = pokemon.abilities[0].ability[0].name
        imageView.image = UIImage(named: pokemon.sprites[0].frontDefault)
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
}
