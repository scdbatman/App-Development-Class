//
//  ViewController.swift
//  Family Introduction
//
//  Created by Samuel Bradshaw  on 2/21/25.
//

import UIKit

class FamilyIntroduction: UIViewController {

    @IBOutlet var momButton: UIButton!
    @IBOutlet var dadButton: UIButton!
    @IBOutlet var janeButton: UIButton!
    @IBOutlet var colinButton: UIButton!
    @IBOutlet var charlieButton: UIButton!
    @IBOutlet var quinnButton: UIButton!
    
    
    let dad = FamilyMember(name: "Dan", age: "51", hobbies: "piano, puzzles", personality: "easy going", job: "Music Theory Proffesor", birthday: "September 26 ", rating: "8/10", pictures: ["Dad1", "Dad2", "Dad3"])
    let mom = FamilyMember(name: "Emily", age: "48", hobbies: "singing, running", personality: "Determined", job: "Instructional Designer", birthday: "March 25", rating: "9/10", pictures: ["Mom1", "Mom2", "Mom3"])
    let jane = FamilyMember(name: "Jane", age: "23", hobbies: "singing, rock climbing", personality: "goofy", job: "language teacher", birthday: "September 21 ", rating: "6/10", pictures: ["Jane1", "Jane2", "Jane3"])
    let colin = FamilyMember(name: "Colin", age: "18", hobbies: "guitar, soccer", personality: "laid back", job: "Missionary", birthday: "December 6 ", rating: "7/10", pictures: ["Colin1", "Colin2", "Colin3"])
    let charlie = FamilyMember(name: "Charlie", age: "16", hobbies: "fortnite, body boarding", personality: "passionate", job: "line cook", birthday: "April 19 ", rating: "7/10", pictures: ["Charles1", "Charles2", "Charles3"])
    let quinn = FamilyMember(name: "Quinn", age: "10", hobbies: "BTD, plants and bugs", personality: "wonderful", job: "child", birthday: "August 14", rating: "10/10", pictures: ["Quinn1", "Quinn2", "Quinn3"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func familyButtonPressed(_ sender: UIButton) {
        let id = "familySpecifics"
        switch sender {
        case dadButton:
            // STEP 1:
            performSegue(withIdentifier: id, sender: dad)
        case momButton:
            performSegue(withIdentifier: id, sender: mom)
        case janeButton:
            // STEP 1:
            performSegue(withIdentifier: id, sender: jane)
        case colinButton:
            performSegue(withIdentifier: id, sender: colin)
        case charlieButton:
            // STEP 1:
            performSegue(withIdentifier: id, sender: charlie)
        case quinnButton:
            performSegue(withIdentifier: id, sender: quinn)

//            performSegue(withIdentifier: "familySpecifics", sender: mom)
        default:
            fatalError()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // STEP 3
        guard let selectedFamilyMember = sender as? FamilyMember else { fatalError() }

        if let familySpecificsVC = segue.destination as? FamilySpecifics {
            familySpecificsVC.familyMember = selectedFamilyMember
        }
    }
    
}
