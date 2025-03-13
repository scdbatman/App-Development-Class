//
//  ViewController.swift
//  Apple Pie Game
//
//  Created by Samuel Bradshaw  on 2/10/25.
//

import UIKit

class ViewController: UIViewController {
    var listOfWords = ["sailor", "swift", "glorious",     "super", "bug", "bad", "bland", "brave", "program", "strong", "played", "purple", "physics"]
    var incorectMovesAllowed = 7
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    @IBOutlet var treeImageView: UIImageView!

    @IBOutlet var correctWorldLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var guess: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }
    var currentGame: Game!
    
    func newRound() {
        let rand = Int.random(in: 0..<listOfWords.count)
        let newWord = listOfWords[rand]
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorectMovesAllowed, guessedLetters: [])
        for button in letterButtons {
            button.isEnabled = true
        }
            updateUI()
    }
    
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        
        correctWorldLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins) Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        guess.text = "You have \(currentGame.incorrectMovesRemaining) left. make them count!"
    }
    
    func updateGameStatus() {
        if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        }else if currentGame.incorrectMovesRemaining <= 0 {
            totalLosses += 1
        }else {
            updateUI()
        }
    }
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        
        guard let titleLabel = sender.titleLabel?.text else {
            print("titleLabel text is nil")
            return 
        }
        let letterString = titleLabel
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameStatus()
    }
    
}

