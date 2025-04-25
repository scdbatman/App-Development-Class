//
//  JournalEntry.swift
//  User Notification Practice
//
//  Created by Brad Forsyth on 4/21/25.
//

import Foundation

class JournalEntry {
    let identifer: UUID
    let date: Date = Date()
    var text: String
    
    init(identifer: UUID = .init(), text: String) {
        self.identifer = identifer
        self.text = text
    }
    
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
}
