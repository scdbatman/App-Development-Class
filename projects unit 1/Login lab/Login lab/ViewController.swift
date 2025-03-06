//
//  ViewController.swift
//  Login lab
//
//  Created by Samuel Bradshaw  on 1/29/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var userName: UITextField!
    
    @IBOutlet var forgotUsernameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.title = userName.text
        guard let sender = sender as? UIButton else {return}
       
        if sender ==  forgotUsernameButton {
            segue.destination.navigationItem.title = "Forgot Username"
        }else if sender == forgotPasswordButton {
            segue.destination.navigationItem.title = "Forgot Password"
        }
    }
    
    @IBAction func forgotUsernameAction(_ sender: Any) {
        performSegue(withIdentifier: "forgotUsernameOrPassword", sender: sender)
    
    }
    
    @IBAction func forgotPasswordAction(_ sender: Any) {
        performSegue(withIdentifier: "forgotUsernameOrPassword", sender: sender)
    }
    
    
    
    
}

