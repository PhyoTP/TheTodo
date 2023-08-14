//
//  New Todo View.swift
//  TheTodo
//
//  Created by T Krobot on 14/8/23.
//

import SwiftUI

struct NewTaskView: View {
    @State private var taskTitle = ""
    @State private var taskSubtitle = ""
    @State private var deadline = Date.now
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
                    DatePicker("Deadline", selection: $deadline)
                }
            }
            Section("Actions") {
                Button("Save") {
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
        
    }
}
