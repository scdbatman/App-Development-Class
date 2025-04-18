import UIKit
import SwiftUI
var greeting = "Hello, playground"

protocol Ruleset {
    func checkWin()
    func doubleDown()
    func points()
}

protocol Dealer {
    var deck: DeckOfCards { get set }
    func shuffle()
    func dealToLeft()
    func hitMe()
}
enum Suit: String, CaseIterable{
    case diamonds = "Diamonds"
    case hearts = "Hearts"
    case clubs = "Clubs"
    case spades = "Spades"
}
enum Rank: String, CaseIterable {
    case ace = "ace"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case ten = "10"
    case jack = "Jack"
    case queen = "Queen"
    case king = "King"
}
struct Card{
    let rank: Rank
    let suit: Suit
}
class DeckOfCards {
    var cards: [Card]
    init() {
        self.cards = []
        for suit in Suit.allCases {
            for rank in Rank.allCases{
                let card = Card(rank: rank, suit: suit)
                cards.append(card)
            }
        }
    }
}

class Player {
    var money: Int = 500
    var currentBet: Int = 10
    var confidence: String = "way Too High"
}
class CasinoRuleset: Ruleset {
    func checkWin() {
    }
    
    func doubleDown() {
        
    }
    
    func points() {
        
    }
}
class Game {
    
}
