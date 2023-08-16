//
//  Todo.swift
//  TheTodo
//
//  Created by T Krobot on 16/8/23.
//

import Foundation

struct Todo: Identifiable{
    var id = UUID()
    var title: String
    var subtitle: String
    var deadline: Date?
    var isDone: Bool
}
