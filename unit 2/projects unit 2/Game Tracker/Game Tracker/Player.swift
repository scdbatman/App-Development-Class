//
//  Player.swift
//  Game Tracker
//
//  Created by Samuel Bradshaw  on 4/7/25.
//

import Foundation

class Player {
    var name: String
    var score: Int
    var picture: String
    var id = UUID()
    
    init(name: String, score: Int, picture: String) {
        self.name = name
        self.score = score
        self.picture = picture
    }
}
