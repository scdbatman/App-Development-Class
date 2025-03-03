//
//  ViewController.swift
//  delegate practice
//
//  Created by Samuel Bradshaw  on 3/3/25.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var largeTextView: UITextView!
    let bannedWords = ["badWord", "badWord2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        largeTextView.delegate = self
        
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text.isEmpty {
            return true
        }
        var wholetext = textView.text! + text
        
        if bannedWords.contains(wholetext) {
            return false
        }
        return true
    }
}

