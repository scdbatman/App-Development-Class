//
//  ViewController.swift
//  Tally App
//
//  Created by Samuel Bradshaw  on 2/21/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var TallyNumber: UILabel!
    @IBOutlet var TallyText: UILabel!
    var tally = 0
    var tallyText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func IncreaseTallies(_ sender: Any) {
        tally += 1
        
            if tally % 5 == 1 && tally != 1 {
                tallyText += " "
            }
            tallyText += "|"
        
        
        TallyNumber.text = String(tally)
        TallyText.text = tallyText
        
    }
    
}

