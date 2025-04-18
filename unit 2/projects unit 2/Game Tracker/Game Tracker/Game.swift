//
//  Game.swift
//  Game Tracker
//
//  Created by Samuel Bradshaw  on 4/10/25.
//

import Foundation
enum SortBy: Int, CaseIterable {
    case highestFirst = 0
    case lowestFirst = 1
    
    var title: String {
        switch self {
        case .highestFirst:
            return "Winners first"
        case .lowestFirst:
            return "Losers first"
        }
    }
}
enum SortOrder: Int, CaseIterable {
    case highestFirst = 0
    case lowestFirst = 1
    
    var title: String {
        switch self {
        case .highestFirst:
            return "Highest"
        case .lowestFirst:
            return "Lowest"
        }
    }
}

class Game {
    var name: String
    var currentWinner: String {
        if whoWins == .highestFirst{
            var highest = playerList.first
            for player in playerList {
                if player.score > highest?.score ?? 0 {
                    highest = player
                }
            }
            return highest?.name ?? "no current winner"
        } else {
            var lowest = playerList.first
            for player in playerList {
                if player.score < lowest?.score ?? 0 {
                    lowest = player
                }
            }
            return lowest?.name ?? "no current winner"
        }
    }
    var sortPlayers: SortBy
    var whoWins: SortOrder
    var playerList: [Player] = []
    var id = UUID()
    
    init(name: String, sortPlayers: SortBy, whoWins: SortOrder) {
        self.name = name
        self.sortPlayers = sortPlayers
        self.whoWins = whoWins
    }
}
