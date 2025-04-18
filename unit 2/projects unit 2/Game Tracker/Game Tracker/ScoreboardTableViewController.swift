//
//  ScoreboardTableViewController.swift
//  Game Tracker
//
//  Created by Samuel Bradshaw  on 4/7/25.
//

import UIKit

class ScoreboardTableViewController: UITableViewController, CustomPlayerTableViewCellDelegate {
    var game: Game? = nil
    var selectedPlayer: Player?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let game {
            return game.playerList.count
        }else {
            return 0
        }

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "player", for: indexPath) as! CustomPlayerTableViewCell
        guard let game else {
            fatalError()
        }
        cell.assignPlayerInformation(player: game.playerList[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    @IBAction func unwindToScoreboardSegue(_ unwindSegue: UIStoryboardSegue) {
        
        let sourceViewController = unwindSegue.source as! AddPlayerTableViewController
        if let player = sourceViewController.player {
            if let selectedPlayer {
                guard let index = game?.playerList.firstIndex(where: {$0.id == selectedPlayer.id}) else {
                    return
                }
                game?.playerList[index] = player
            }else {
                game?.playerList.append(player)
            }
            tableView.reloadData()
            print(game)
        }
        //sortPlayerScore()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPlayer = game?.playerList[indexPath.row]
        performSegue(withIdentifier: "editPlayer", sender: nil)
    }
    
    func sortPlayerScore() {
        if (game?.sortPlayers == .highestFirst && game?.whoWins == .highestFirst) || (game?.sortPlayers == .lowestFirst && game?.whoWins == .lowestFirst) {
            game?.playerList.sort { $0.score > $1.score }
        } else {
            game?.playerList.sort { $0.score < $1.score }
        }
        
    }
    
    @IBAction func addPlayerButtonPressed(_ sender: Any) {
        selectedPlayer = nil
        performSegue(withIdentifier: "editPlayer", sender: nil)
    }
    
    @IBSegueAction func editPlayerSegue(_ coder: NSCoder) -> AddPlayerTableViewController? {
        let editPlayerController = AddPlayerTableViewController(coder: coder)
        if let selectedPlayer {
            editPlayerController?.player = selectedPlayer
        }
        return editPlayerController
    }
    
}
