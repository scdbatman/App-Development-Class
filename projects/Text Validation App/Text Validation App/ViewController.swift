//
//  ViewController.swift
//  Text Validation App
//
//  Created by Samuel Bradshaw  on 2/25/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var usernameInput: UITextField!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var passwordInput: UITextField!
    @IBOutlet var passwordLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitButton(_ sender: Any) {
        let username = usernameInput.text
        guard let password = passwordInput.text else {
            passwordLabel.textColor = .red
            passwordLabel.text = "error"
            return
        }
        
        let specialSymbol = "[@,.!#$%^&*<>?+=-]"
        guard let range = password.range(of: specialSymbol, options: .regularExpression) else {
            passwordLabel.textColor = .red
            passwordLabel.text = "You must include at least one special symbol in your password"
            return
        }
        
        if password.count < 8 {
            passwordLabel.textColor = .red
            passwordLabel.text = "Your password must be at least 8 characters long"
            return
        }else{
            passwordLabel.textColor = .blue
            passwordLabel.text = "Logging in please wait..."
        }
        
        
    }
    
}

