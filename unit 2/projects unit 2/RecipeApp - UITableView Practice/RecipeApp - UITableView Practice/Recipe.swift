//
//  Recipe.swift
//  RecipeApp - UITableView Practice
//
//  Created by Brad Forsyth on 3/11/25.
//

import Foundation

struct Recipe {
    var title: String
    var ingredients: [String]
    var notes: String?
    
    func formattedIngredients() -> String {
        return ingredients.joined(separator: ", ")
    }
}
