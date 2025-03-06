//
//  ViewController.swift
//  Light
//
//  Created by Samuel Bradshaw  on 1/21/25.
//

import UIKit

class ViewController: UIViewController {
    var lightOn = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }



    fileprivate func updateUI() {
        view.backgroundColor = lightOn ? .white : .black
    }
    
    @IBAction func ButtonPressed(_ sender: Any) {
        lightOn.toggle()
        updateUI()
    }//end of IBAction buttonPressed
    
}//end of class ViewController

