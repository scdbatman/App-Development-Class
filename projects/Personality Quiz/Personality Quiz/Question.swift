//
//  Question.swift
//  Personality Quiz
//
//  Created by Samuel Bradshaw  on 2/25/25.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
    
    enum ResponseType {
        case single, multiple, ranged
    }
}

struct Answer {
    var text: String
    var type: BenderType
    
    enum BenderType: Character {
        case water = "💦", earth = "🪨", fire = "🔥", air = "💨"
        
        var definition: String {
            switch self {
            case .water: return ""
            case .earth: return ""
            case .fire: return ""
            case .air: return ""
            }
        }
    }
}
