//
//  ScoreboardTableViewController.swift
//  Game Tracker
//
//  Created by Samuel Bradshaw  on 4/7/25.
//

import UIKit

class ScoreboardTableViewController: UITableViewController {
    var playerList: [Player] = []    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "player", for: indexPath) as! CustomPlayerTableViewCell
        cell.assignPlayerInformation(player: playerList[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    @IBAction func unwindToSegue(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source as! AddPlayerTableViewController
        if let player = sourceViewController.player {
            playerList.append(player)
            tableView.reloadData()
        }
        
        
    }

    
}
