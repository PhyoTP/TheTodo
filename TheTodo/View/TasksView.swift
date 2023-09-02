//
//  TasksView.swift
//  TheTodo
//
//  Created by T Krobot on 14/8/23.
//

import SwiftUI
func colorChooser(done:Bool,dateline:Date, haveDateline:Bool) -> Color{
    if done{
        return .black
    }else{
        if haveDateline{
            if dateline<Date.now{
                return .red
            }else{
                return .black
            }
        }else{
            return .black
        }
    }
}
struct TasksView: View {
    @EnvironmentObject var settings: todoManager
    @State private var showNewTodoSheet = false
    @State private var showConfirmAlert = false
    var body: some View {
        NavigationStack {
            ZStack{
                Color.orange
                    .ignoresSafeArea()
                VStack{
                    List($settings.todos, editActions: .all) { $todo in
                        NavigationLink {
                            Form{
                                Section("Info"){
                                    Toggle(isOn: $todo.isDone){
                                        Text("Is done?")
                                    }
                                    TextField("Title", text: $todo.title)
                                    TextField("Subtitle", text: $todo.subtitle)
                                    Toggle(isOn: $todo.haveDeadline){
                                        Text("Have deadline?")
                                    }
                                    if todo.haveDeadline{
                                        DatePicker("Deadline", selection: $todo.deadline)
                                    }
                                    Toggle(isOn: $todo.haveLink){
                                        Text("Have link?")
                                    }
                                    if todo.haveLink{
                                        TextField("Link", text: $todo.urlString)
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
                                        .foregroundColor(colorChooser(done: todo.isDone, dateline: todo.deadline, haveDateline: todo.haveDeadline))
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
                                    if todo.haveLink{
                                        if let validURL = todo.link {
                                            Link(todo.urlString, destination: validURL)
                                                .font(.caption)
                                        } else {
                                            
                                        }
                                        
                                        
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
                        ToolbarItem(placement: .navigationBarTrailing){
                            Button{
                                showConfirmAlert = true
                            }label:{
                                Image(systemName: "square.and.arrow.down")
                            }
                        }
                    }
                    .sheet(isPresented: $showNewTodoSheet) {
                        NewTaskView()
                            .presentationDetents([.medium, .large])
                    }
                    .alert("Show sample data? This cannot be reversed!", isPresented: $showConfirmAlert) {
                        Button("Replace", role: .destructive) {
                            settings.todos = Todo.sampleTodos
                        }
                    }
                }
            }
        }
    }

}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(todoManager())
    }
}
