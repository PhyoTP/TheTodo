//
//  Todo.swift
//  TheTodo
//
//  Created by T Krobot on 16/8/23.
//

import Foundation

struct Todo: Identifiable, Codable{
    var id = UUID()
    var title: String
    var subtitle: String
    var haveDeadline: Bool
    var deadline: Date
    var isDone: Bool
    var haveLink: Bool
    var urlString: String
    var link: URL? {
            return URL(string: urlString)
        }
}

