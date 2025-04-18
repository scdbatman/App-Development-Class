import UIKit

var greeting = "Hello, playground"


struct Note: Codable {
    let title: String
    let text: String
    let timeStamp: Date
}

let note1 = Note(title: "todo", text: "nothing we chillin", timeStamp: Date())
let note2 = Note(title: "to not do", text: "nothing we chillin", timeStamp: Date())
let note3 = Note(title: "to do if not", text: "nothing we chillin", timeStamp: Date())
let note4 = Note(title: "to do when busy", text: "nothing we chillin", timeStamp: Date())
let notes = [note1, note2, note3, note4]
//let propertyListEncoder = PropertyListEncoder()
//if let encodedNote = try? propertyListEncoder.encode(newNote) {
//    print(encodedNote)
//    let propertyListDecoder = PropertyListDecoder()
//    if let decodedNote = try? propertyListDecoder.decode(Note.self, from: encodedNote) {
//        print(decodedNote)
//    }
//}

let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let archiveURL = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")

let propertyListEncoder = PropertyListEncoder()
let encodedNote = try? propertyListEncoder.encode(notes)
try? encodedNote?.write(to: archiveURL, options: .noFileProtection)
print(encodedNote)
let propertyListDecoder = PropertyListDecoder()
if let retrievedNoteData = try? Data(contentsOf: archiveURL), let decodedNote = try? propertyListDecoder.decode(Array<Note>.self, from: retrievedNoteData) {
        print(decodedNote)
    }


