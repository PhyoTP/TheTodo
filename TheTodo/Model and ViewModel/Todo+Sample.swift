//
//  Todo+Sample.swift
//  TheTodo
//
//  Created by T Krobot on 25/8/23.
//

import Foundation

extension Todo {
    static let sampleTodos = [
        Todo(title: "Add something", subtitle: "There's nothing here",haveDeadline: false, deadline: Date.now, isDone: true, haveLink: true, urlString: "tk.sg/bbcs"),
        Todo(title: "Tap + to make a new task", subtitle: "at the top right", haveDeadline: true, deadline: Date.now, isDone: false, haveLink: false, urlString: "tk.sg/importantlink"),
        Todo(title: "History Notes", subtitle: "WA4", haveDeadline: true, deadline: Date.now, isDone: false, haveLink: false, urlString: "tk.sg/bbcs"),
        Todo(title: "Math Challenge", subtitle: "", haveDeadline: false, deadline: Date.now, isDone: true, haveLink: false, urlString: ""),
        Todo(title: "Hackathon", subtitle: "Presidential Elections App", haveDeadline: true, deadline: Date.now, isDone: false, haveLink: true, urlString: "tk.sg/importantlink")
    ]
}
