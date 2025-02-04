//
//  ViewController.swift
//  Two Buttons
//
//  Created by Samuel Bradshaw  on 1/23/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var text: UITextField!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressedSetText(_ sender: UIButton) {
        label.text = text.text
    }
   
    
    @IBAction func buttonPressedClearText(_ sender: UIButton) {
        label.text = ""
        text.text = ""
    }
    
     
    
}

