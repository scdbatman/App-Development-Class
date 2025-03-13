//
//  ViewController.swift
//  CommonInputControls
//
//  Created by Samuel Bradshaw  on 1/23/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var toggle: UISwitch!
    @IBOutlet var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: Any) {
        print("Button was pressed")
        if toggle.isOn {
            print("Switch is on :)")
        } else {
            print("Switch is off :(")
        }//end of else
        
        print(slider.value)
    }
    
    @IBAction func printSwitch(_ sender: UISwitch) {
//        if sender.isOn {
//            print("Switch is on :)")
//        } else {
//            print("Switch is off :(")
//        }
    }
    @IBAction func printSliderValue(_ sender: UISlider) {
        //print(sender.value)
    }
  
    
    @IBAction func keyboardEnterPrintText(_ sender: UITextField) {
        
            if let text = sender.text{
                print(text)
            }
        
    }
    
    
}

