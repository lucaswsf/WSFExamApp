//
//  Character.swift
//  ExamApp
//
//  Created by Lucas Marot on 10/06/2016.
//  Copyright © 2016 Web School Factory. All rights reserved.
//

import Foundation
import Alamofire

struct Character {
    
    //name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, homeworld
    let name: String
    let height: Int
    let mass: Int
    let hair_color: String
    let skin_color: String
    let eye_color: String
    let birth_year: Int
    let gender: String
    let homeworld: String
    
    //Constructeur prenant en entrée un Dictionary
    init(dict: Dictionary<String, AnyObject>) {
        
        //Les infos de base
        name = dict["name"] as! String
        height = dict["height"] as! Int
        mass = dict["mass"] as! Int
        hair_color = dict["hair_color"] as! String
        skin_color = dict["skin_color"] as! String
        eye_color = dict["eye_color"] as! String
        birth_year = dict["birth_year"] as! Int
        gender = dict["gender"] as! String
        homeworld = dict["homeworld"] as! String
        }
    }

extension Character {
    static func getRemoteCharacters(completionHandler: Response<AnyObject, NSError> -> Void) {
        
        Alamofire.request(.GET, "http://swapi.co/api/people").responseJSON { response in completionHandler(response) }
    }
}
