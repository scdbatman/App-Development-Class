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
    
    
    
    let dad = FamilyMember(name: "Dan", age: "51", hobbies: "piano, puzzles", personality: "easy going", job: "Music Theory Proffesor", birthday: "September 26 ", rating: "8/10")
    let mom = FamilyMember(name: "Emily", age: "51", hobbies: "piano, puzzles", personality: "easy going", job: "Music Theory Proffesor", birthday: "September 26 ", rating: "8/10")
    let jane = FamilyMember(name: "Jane", age: "51", hobbies: "piano, puzzles", personality: "easy going", job: "Music Theory Proffesor", birthday: "September 26 ", rating: "8/10")
    let colin = FamilyMember(name: "Colin", age: "51", hobbies: "piano, puzzles", personality: "easy going", job: "Music Theory Proffesor", birthday: "September 26 ", rating: "8/10")
    let charlie = FamilyMember(name: "Charlie", age: "51", hobbies: "piano, puzzles", personality: "easy going", job: "Music Theory Proffesor", birthday: "September 26 ", rating: "8/10")
    let quinn = FamilyMember(name: "Quinn", age: "51", hobbies: "piano, puzzles", personality: "easy going", job: "Music Theory Proffesor", birthday: "September 26 ", rating: "8/10")
    
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
