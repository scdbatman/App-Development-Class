//
//  AddPlayerTableViewController.swift
//  Game Tracker
//
//  Created by Samuel Bradshaw  on 4/7/25.
//

import UIKit

class AddPlayerTableViewController: UITableViewController {
    @IBOutlet var inputNameText: UITextField!
    @IBOutlet var inputScoreText: UITextField!
    var player: Player? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    @IBAction func savePlayerPressed(_ sender: Any) {
        guard let name = inputNameText.text else {
            fatalError()
        }
        guard let score = inputScoreText.text else {
            fatalError()
        }

        player = Player(name: name, score: score, picture: "person.crop.circle.fill")
        self.performSegue(withIdentifier: "uwindToScoreboard", sender: sender)
    }
    
}
