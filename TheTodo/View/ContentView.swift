//
//  ContentView.swift
//  TheTodo
//
//  Created by T Krobot on 14/8/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showSheet = false
    var body: some View {
        
        
        NavigationStack{
            ZStack{
                Color.orange
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    Text("TheTodo")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .bold()
                    Text("Designed for Thet Pai, by Thet Pai")
                        .bold()
                    Spacer()
                    Button{
                        showSheet = true
                    }label: {
                        Text("+ Create new task")
                            .padding()
                            .background(.green)
                            .cornerRadius(50)
                            .foregroundColor(.white)
                            .bold()
                    }
                    NavigationLink(destination: TasksView()){
                        Text("Pending tasks        ")
                            .padding()
                            .background(.yellow)
                            .cornerRadius(50)
                            .foregroundColor(.white)
                            .bold()
                    }
                    Spacer()
                }
            }
            .sheet(isPresented: $showSheet){
                NewTaskView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(todoManager())
    }
}
