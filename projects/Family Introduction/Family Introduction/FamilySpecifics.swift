//
//  FamilySpecifics.swift
//  Family Introduction
//
//  Created by Samuel Bradshaw  on 2/27/25.
//

import UIKit

class FamilySpecifics: UIViewController {

    var familyMember: FamilyMember?
    
    required init?(coder: NSCoder) {
        // STEP 2
        familyMember = nil
        super.init(coder: coder)
    }
    
    @IBOutlet var familyMemberImage1: UIImageView!
    @IBOutlet var familyMemberImage2: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var birthdayLabel: UILabel!
    @IBOutlet var personalityLabel: UILabel!
    @IBOutlet var hobbiesLabel: UILabel!
    @IBOutlet var jobLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    
    
    override func viewDidLoad() {
        // STEP 4
        super.viewDidLoad()
        guard let familyMember else { fatalError() }
        
        nameLabel.text = "Name: \(familyMember.name)"
        ageLabel.text = "Age: \(familyMember.age)"
        birthdayLabel.text = "Birthday: \(familyMember.birthday)"
        personalityLabel.text = "Personality: \(familyMember.personality)"
        hobbiesLabel.text = "Hobbies: \(familyMember.hobbies)"
        jobLabel.text = "Job: \(familyMember.job)"
        ratingLabel.text = "Rating: \(familyMember.rating)"
        
        print(familyMember.name)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
