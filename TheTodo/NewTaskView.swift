//
//  New Todo View.swift
//  TheTodo
//
//  Created by T Krobot on 14/8/23.
//

import SwiftUI

struct NewTaskView: View {
    @EnvironmentObject var settings: GameSettings
    @State private var taskTitle = ""
    @State private var taskSubtitle = ""
    @State private var dateline = Date.now
    @State private var haveDeadline = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Form{
            Section("Info"){
                TextField("Title", text: $taskTitle)
                TextField("Subtitle", text: $taskSubtitle)
                Toggle(isOn: $haveDeadline){
                    Text("Have deadline?")
                }
                if haveDeadline{
                    DatePicker("Deadline", selection: $dateline)
                }
            }
            Section("Actions") {
                Button("Save") {
                    var newTodo = Todo(title: taskTitle, subtitle: taskSubtitle, isDone: false)
                    if haveDeadline{
                        newTodo.deadline = dateline
                    }
                    settings.todos.append(newTodo)
                    dismiss()
                }
                Button("Cancel", role: .destructive) {
                    dismiss()
                }
            }
        }
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView()
            .environmentObject(GameSettings())
        
    }
}
