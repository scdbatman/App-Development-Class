//
//  EntryViewDelegate.swift
//  User Notification Practice
//
//  Created by Brad Forsyth on 4/21/25.
//

import Foundation

protocol EntryViewDelegate: AnyObject {
    func journalEntryDidSave(_ journalEntry: JournalEntry)
}
