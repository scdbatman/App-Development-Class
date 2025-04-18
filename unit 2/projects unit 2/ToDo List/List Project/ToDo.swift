//
//  ToDo.swift
//  List Project
//
//  Created by Samuel Bradshaw  on 4/18/25.
//

import Foundation
struct ToDo {
    let id = UUID()
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    
    static func ==(lhs: ToDo, rhs: ToDo) -> Bool {
        return lhs.id == rhs.id
    }
    static func loadToDos() -> [ToDo]? {
        return nil
    }
    static func loadSampleToDos() -> [ToDo] {
        let toDo1 = ToDo(title: "Welcome!", isComplete: false, dueDate: Date(), notes: "Welcome to your to-do list!")
        let toDo2 = ToDo(title: "Welcome!", isComplete: false, dueDate: Date(), notes: "Welcome to your to-do list!")
        let toDo3 = ToDo(title: "Welcome!", isComplete: false, dueDate: Date(), notes: "Welcome to your to-do list!")
        return [toDo1, toDo2, toDo3]
    }
    
    
    
    
    
}
