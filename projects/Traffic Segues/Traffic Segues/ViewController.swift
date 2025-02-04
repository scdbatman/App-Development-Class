//
//  ViewController.swift
//  Traffic Segues
//
//  Created by Samuel Bradshaw  on 1/29/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var segueSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func yellowButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "Yellow", sender: nil)
        
    }
    
    @IBAction func greenButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "Green", sender: nil)
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return segueSwitch.isOn
        
    }
    
}
