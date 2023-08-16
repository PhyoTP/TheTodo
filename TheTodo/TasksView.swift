//
//  TasksView.swift
//  TheTodo
//
//  Created by T Krobot on 14/8/23.
//

import SwiftUI
class GameSettings: ObservableObject {
    @Published var todos = [
        Todo(title: "Hey", subtitle: "There's nothing here",haveDeadline: false, deadline: Date.now, isDone: false)
    ]
}
struct TasksView: View {
    @EnvironmentObject var settings: GameSettings
    @State private var showNewTodoSheet = false
    
    var body: some View {
        NavigationStack {
            List($settings.todos, editActions: .all) { $todo in
                NavigationLink {
                    Form{
                        Section("Info"){
                            TextField("Title", text: $todo.title)
                            TextField("Subtitle", text: $todo.subtitle)
                            Toggle(isOn: $todo.haveDeadline){
                                Text("Have deadline?")
                            }
                            if todo.haveDeadline{
                                DatePicker("Deadline", selection: $todo.deadline)
                            }
                        }
                    }
                    .navigationTitle("Todo Detail")
                } label: {
                    HStack {
                        Image(systemName: todo.isDone ? "checkmark.circle.fill" : "circle" )
                            .onTapGesture {
                                todo.isDone.toggle()
                            }
                        VStack(alignment: .leading) {
                            Text(todo.title)
                                .strikethrough(todo.isDone)
                            if !todo.subtitle.isEmpty {
                                Text(todo.subtitle)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            if todo.haveDeadline{
                                Text(todo.deadline.formatted(date:.long, time: .shortened))
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                    
                }
            }
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showNewTodoSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showNewTodoSheet) {
                NewTaskView()
                    .presentationDetents([.medium, .large])
            }
        }
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(GameSettings())
    }
}
