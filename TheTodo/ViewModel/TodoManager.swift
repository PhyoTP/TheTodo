//
//  TodoManager.swift
//  TheTodo
//
//  Created by T Krobot on 19/8/23.
//

import Foundation
import SwiftUI
var linker = URL(string: "")!
class TodoManager: ObservableObject {
    @Published var todos: [Todo] = [
        Todo(title: "Hey", subtitle: "There's nothing here",haveDeadline: false, deadline: Date.now, isDone: true, haveLink: true, urlString: "tk.sg/bbcs"),
        Todo(title: "Tap + to make a new task", subtitle: "at the top right", haveDeadline: true, deadline: Date.now, isDone: false, haveLink: false, urlString: "tk.sg/importantlink")
    ] {
        didSet {
            save()
        }
    }
        
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "todos.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedTodos = try? propertyListEncoder.encode(todos)
        try? encodedTodos?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
                
        if let retrievedTodoData = try? Data(contentsOf: archiveURL),
            let todosDecoded = try? propertyListDecoder.decode([Todo].self, from: retrievedTodoData) {
            todos = todosDecoded
        }
    }
}
