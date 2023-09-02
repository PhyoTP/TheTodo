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
        Todo(title: "Tap + to make a new task", subtitle: "at the top right", haveDeadline: false, deadline: Date.now, isDone: false, haveLink: false, urlString: "tk.sg/importantlink"),
        Todo(title: "History Notes", subtitle: "WA4", haveDeadline: true, deadline: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 2, hour: 11, minute: 30)) ?? Date(), isDone: false, haveLink: false, urlString: "tk.sg/bbcs"),
        Todo(title: "Math Challenge", subtitle: "", haveDeadline: false, deadline: Date.now, isDone: true, haveLink: false, urlString: ""),
        Todo(title: "Hackathon", subtitle: "Presidential Elections App", haveDeadline: true, deadline: Calendar.current.date(from: DateComponents(year: 2023, month: 8, day: 26, hour: 11, minute: 30)) ?? Date(), isDone: true, haveLink: true, urlString: "tk.sg/importantlink")
    ]
}
