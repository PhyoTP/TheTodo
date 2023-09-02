//
//  New Todo View.swift
//  TheTodo
//
//  Created by T Krobot on 14/8/23.
//

import SwiftUI

struct NewTaskView: View {
    @EnvironmentObject var settings: todoManager
    @State private var taskTitle = ""
    @State private var taskSubtitle = ""
    @State private var dateline = Date.now
    @State private var haveDeadline = false
    
    @State private var linked = "youtube.com"
    @State private var haveLink = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Form{
            Section("Info"){
                TextField("Title", text: $taskTitle)
                TextField("Subtitle", text: $taskSubtitle)
                Toggle(isOn: $haveDeadline){
                    HStack{
                        Image(systemName: "calendar.badge.plus")
                        Text("Have deadline?")
                    }
                }
                if haveDeadline{
                    VStack{
                        Image(systemName: "calendar.badge.clock")
                        DatePicker("Deadline", selection: $dateline)
                    }
                }
                Toggle(isOn:$haveLink){
                    HStack{
                        Image(systemName: "link.badge.plus")
                        Text("Have link?")
                    }
                }
                if haveLink{
                    HStack{
                        Image(systemName: "link")
                        TextField("Link", text: $linked)
                    }
                }
            }
            Section("Actions") {
                Button("Save") {
                    var newTodo = Todo(title: taskTitle, subtitle: taskSubtitle, haveDeadline: false, deadline: Date.now, isDone: false,haveLink: false, urlString: "tk.sg/importantlink")
                    if haveDeadline{
                        newTodo.haveDeadline = true
                        newTodo.deadline = dateline
                    }
                    if haveLink{
                        newTodo.haveLink = true
                        newTodo.urlString = linked
                        
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
            .environmentObject(todoManager())
        
    }
}
