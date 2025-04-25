//
//  EntryViewController.swift
//  User Notification Practice
//
//  Created by Brad Forsyth on 4/21/25.
//

import UIKit

class EntryViewController: UIViewController {
    
    var journalEntry: JournalEntry?
    var delegate: EntryViewDelegate?
    
    @IBOutlet var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let entry = journalEntry {
            self.navigationItem.title = "Edit Entry"
            self.textView.text = entry.text
        } else {
            self.navigationItem.title = "New Entry"
            self.textView.becomeFirstResponder()
        }
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        if let entry = journalEntry {
            entry.text = self.textView.text
            self.delegate?.journalEntryDidSave(entry)
        } else if let text = self.textView.text, !text.isEmpty {
            let newEntry = JournalEntry(text: text)
            self.delegate?.journalEntryDidSave(newEntry)
        }
        
        self.dismiss(animated: true)
    }
}
