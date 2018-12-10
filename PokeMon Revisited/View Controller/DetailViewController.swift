//
//  DetailViewController.swift
//  PokeMon Revisited
//
//  Created by Iyin Raphael on 12/9/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    var pokemon: PokeMon?
    var Model: Model?
    
    func updateView() {
        
        guard isViewLoaded, let pokemon = pokemon else {return}
        
        nameLabel.text = pokemon.name
        IDLabel.text = String(pokemon.id)
        typeLabel.text = pokemon.types[0].type[0].name
        abilitiesLabel.text = pokemon.abilities[0].ability[0].name
        imageView.image = UIImage(named: pokemon.sprites[0].frontDefault)
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var IDLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
}
