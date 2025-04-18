//
//  EditGameViewController.swift
//  Game Tracker
//
//  Created by Samuel Bradshaw  on 4/10/25.
//

import UIKit

class EditGameViewController: UIViewController {
    @IBOutlet var gameName: UITextField!
    @IBOutlet var sortPlayersLabel: UILabel!
    @IBOutlet var sortPlayersSegmentedControl: UISegmentedControl!
    @IBOutlet var whoWinsLabel: UILabel!
    @IBOutlet var whoWinsSegmentedControl: UISegmentedControl!
    @IBOutlet var gameErrorLabel: UILabel!
    var game: Game? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        gameErrorLabel.text = ""
        sortPlayersSegmentedControl.removeAllSegments()
        whoWinsSegmentedControl.removeAllSegments()
        for sort in SortBy.allCases {
            sortPlayersSegmentedControl.insertSegment(withTitle: sort.title, at: sort.rawValue, animated: false)
        }
        for sort in SortOrder.allCases {
            whoWinsSegmentedControl.insertSegment(withTitle: sort.title, at: sort.rawValue, animated: false)
        }
        
        if let game {
            gameName.text = game.name
            sortPlayersSegmentedControl.selectedSegmentIndex = game.sortPlayers.rawValue
            whoWinsSegmentedControl.selectedSegmentIndex = game.whoWins.rawValue
        }else {
            gameName.text = ""
            sortPlayersSegmentedControl.selectedSegmentIndex = 0
            whoWinsSegmentedControl.selectedSegmentIndex = 0
            game = Game(name: "", sortPlayers: SortBy(rawValue: sortPlayersSegmentedControl.selectedSegmentIndex) ?? .highestFirst, whoWins: SortOrder(rawValue: whoWinsSegmentedControl.selectedSegmentIndex) ?? .highestFirst)
        }
        
        
    }
    
    @IBAction func sortPlayersSegmentPressed(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
                
        guard let sortBy = SortBy(rawValue: index) else {
            fatalError()
        }
        switch sortBy {
        case .highestFirst:
            print("highest score!")
        case .lowestFirst:
            print("lowest score!")
        }
    }
    @IBAction func whoWinsSegmentPressed(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
                
        guard let sortOrder = SortOrder(rawValue: index) else {
            fatalError()
        }
        switch sortOrder {
        case .highestFirst:
            print("highest score!")
        case .lowestFirst:
            print("lowest score!")
        }
    }
    
    @IBAction func saveGamePressed(_ sender: Any) {

        guard let name = gameName.text else{
            gameErrorLabel.text = "please enter a value for name"
            return
        }
        
        game?.name = name
        game?.sortPlayers = .highestFirst
        game?.whoWins = .highestFirst
        self.performSegue(withIdentifier: "uwindToGame", sender: sender)
           
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueDestination = segue.destination as? ScoreboardTableViewController else {
            return
        }
        segueDestination.game = game
    }
    
    
}
