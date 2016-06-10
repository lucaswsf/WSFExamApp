//
//  CharactersViewController.swift
//  ExamApp
//
//  Created by Lucas Marot on 10/06/2016.
//  Copyright © 2016 Web School Factory. All rights reserved.
//

import UIKit

class CharactersViewController: UIViewController {

    var charactersArray: [Character] = []
    //computed properties
    var charactersOffset: Int {
        return charactersArray.count
    }
    
    @IBOutlet weak var characterTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterTV.estimatedRowHeight = 200.0
        characterTV.rowHeight = UITableViewAutomaticDimension
        
        displayCharacters(0)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        guard let cell = sender as? CharacterCell,
            let indexPath = characterTV.indexPathForCell(cell),
            let vc = segue.destinationViewController as? DetailViewController else {
                return
        }
        
        let character = charactersArray[indexPath.row]
        print("character \(character.name)")
        vc.character = character
        
    }
    
    func displayCharacters(offset: Int) {
        //declencher un WS
        //START SPINNER
        NSNotificationCenter.defaultCenter().postNotificationName("spinner_notif", object: nil)
        
        Character.getRemoteCharacters() { (response) in
            
            switch response.result {
            case .Success:
                if let dict = response.result.value as? Dictionary<String, AnyObject> {
                    if let dataDict = dict["data"] {
                        
                        if let array = dataDict["results"] as? Array<AnyObject>  {
                            
                            self.charactersArray += array.map
                                { Character(dict: $0 as! [String: AnyObject]) }
                            
                            self.characterTV.reloadData()
                            //STOP SPINNER
                            NSNotificationCenter.defaultCenter().postNotificationName("spinner_notif", object: nil)
                        }
                    }
                }
                
            case .Failure(let error):
                print(error)
            }
        }
    }
}
