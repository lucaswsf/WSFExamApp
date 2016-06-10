//
//  DetailViewController.swift
//  ExamApp
//
//  Created by Lucas Marot on 10/06/2016.
//  Copyright © 2016 Web School Factory. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var character: Character!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var homeworldLabel: UILabel!
    @IBOutlet weak var birth_yearLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayCharactersInfos()
    }
    
    func displayCharactersInfos() {
        nameLabel.text = character.name
        homeworldLabel.text = character.homeworld
        genderLabel.text = character.gender
    }
}
