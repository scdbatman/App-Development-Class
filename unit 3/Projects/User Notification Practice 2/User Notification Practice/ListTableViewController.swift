//
//  ListTableViewController.swift
//  User Notification Practice
//
//  Created by Brad Forsyth on 4/15/25.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    static var journalEntries: [JournalEntry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Journal"
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification), name: NSNotification.Name("UserDidTapNotification"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: NSNotification.Name("reloadTableView"), object: nil)
    }
    
    // MARK: - UITableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ListTableViewController.journalEntries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JournalEntryCell", for: indexPath)
        
        let entry = ListTableViewController.journalEntries[indexPath.row]
        cell.textLabel?.text = entry.dateString
        cell.detailTextLabel?.text = entry.text
        
        return cell
    }
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "entrySegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let entry = ListTableViewController.journalEntries[indexPath.row]
                let destinationNavController = segue.destination as! UINavigationController
                let destinationViewController = destinationNavController.viewControllers.first as! EntryViewController
                destinationViewController.delegate = self
                destinationViewController.journalEntry = entry
            }
        } else if segue.identifier == "newEntrySegue" {
            let destinationNavController = segue.destination as! UINavigationController
            let destinationViewController = destinationNavController.viewControllers.first as! EntryViewController
            destinationViewController.delegate = self
        }
    }
    
    // MARK: Notification Handling
    
    @objc
    private func handleNotification() {
        self.performSegue(withIdentifier: "newEntrySegue", sender: nil)
    }
    
    @objc
    private func reloadTableView() {
        self.tableView.reloadData()
    }
}

extension ListTableViewController: EntryViewDelegate {
    func journalEntryDidSave(_ journalEntry: JournalEntry) {
        if let existingEntry = ListTableViewController.journalEntries.first(where: { $0.identifer == journalEntry.identifer }) {
            existingEntry.text = journalEntry.text
        } else {
            ListTableViewController.journalEntries.append(journalEntry)
            ListTableViewController.journalEntries.sort { $0.date > $1.date }
        }
        self.tableView.reloadData()
    }
}
