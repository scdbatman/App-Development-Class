//
//  ViewController.swift
//  Apple Pie Game
//
//  Created by Samuel Bradshaw  on 2/10/25.
//

import UIKit

class ViewController: UIViewController {
    var listOfWords = ["buccaneer", "swift", "glorious",     "incandescent", "bug", "program"]
    var incorectMovesAllowed = 7
    var totalWins = 0
    var totalLosses = 0
    
    @IBOutlet var treeImageView: UIImageView!

    @IBOutlet var correctWorldLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }
    var currentGame: Game!
    
    func newRound() {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorectMovesAllowed, guessedLetters: [])
        updateUI()
    }
    
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        
        correctWorldLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins). Losses: \(totalLosses)."
        treeImageView.image = UIImage(named: "Tree.\(currentGame.incorrectMovesRemaining)")
    }
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateUI()
    }
    
}

