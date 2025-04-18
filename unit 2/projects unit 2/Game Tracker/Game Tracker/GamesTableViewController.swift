//
//  GamesTableViewController.swift
//  Game Tracker
//
//  Created by Samuel Bradshaw  on 4/10/25.
//

import UIKit

class GamesTableViewController: UITableViewController, CustomGameTableViewCellDelegate {
    
    
    
    var gameList: [Game] = []
    var selectedGame: Game?
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return gameList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "game", for: indexPath) as! CustomGameTableViewCell
        cell.assignGameInfo(game: gameList[indexPath.row])
        cell.delegate = self

        return cell
    }
    
    @IBAction func unwindToGameSegue(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source as! EditGameViewController
        if let game = sourceViewController.game {
            if let selectedGame {
                guard let index = gameList.firstIndex(where: {$0.id == selectedGame.id}) else {
                    return
                }
                gameList[index] = game
            } else {
                gameList.append(game)
            }
            
            tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedGame = gameList[indexPath.row]
        performSegue(withIdentifier: "editGame", sender: nil)
    }
    
    @IBAction func addGamePressed(_ sender: Any) {
        selectedGame = nil
        performSegue(withIdentifier: "editGame", sender: nil)
    }
    
    @IBSegueAction func addGameSegue(_ coder: NSCoder) -> EditGameViewController? {
        let editGameController = EditGameViewController(coder: coder)
        if let selectedGame {
            editGameController?.game = selectedGame
        }
        return editGameController
    }
    
}
