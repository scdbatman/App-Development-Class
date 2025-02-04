//
//  ViewController.swift
//  InterfaceBuilderBasics
//
//  Created by Samuel Bradshaw  on 1/16/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.textColor = .green
        // Do any additional setup after loading the view.
    }
    @IBOutlet var mainLabel: UILabel!
   
    @IBOutlet var myButton: UIButton!
    
    @IBAction func changeText(_ sender: Any) {
        mainLabel.textColor = .red
        mainLabel.text = "why'd you do it :("
    }
    
    }

