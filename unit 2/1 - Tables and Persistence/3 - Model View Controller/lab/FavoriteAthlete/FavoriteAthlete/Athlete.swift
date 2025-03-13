//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by Samuel Bradshaw  on 3/12/25.
//

import Foundation

struct Athlete {
    var name: String
    var age: Int
    var team: String
    var league: String
    
    var description: String {
        return "\(name) is \(age) years old and plays for the \(team) in the \(league)."
    }
}
