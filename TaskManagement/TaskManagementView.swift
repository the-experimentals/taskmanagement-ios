//
//  ContentView.swift
//  TaskManagement
//
//  Created by Bibek Saini on 2023-09-26.
//

import SwiftUI

struct TaskManagementView: View {
    
    @State private var newTaskTitle: String = ""
    @State private var newTaskDescription: String = ""
    @State private var newTaskDate: Date = Date()
    @State private var tasks: [Task] = []
    
    @State private var selectedTask: Task?
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Add a task")){
                    TextField("Title", text: $newTaskTitle)
                    ZStack(alignment: .topLeading){
                        if newTaskDescription.isEmpty{
                            Text("Description").foregroundColor(.gray)
                        }
                        
                        TextEditor(text: $newTaskDescription)
                    }.frame(height: 100)
                    
                    DatePicker("Due date", selection: $newTaskDate, displayedComponents: [.date])
                    Button("Add"){
                        addTask()
                    }
                }
                
                Section(header: Text("Tasks")){
                    ForEach(tasks){task in
                        NavigationLink(destination: TaskDetail(task: task), tag: task, selection: $selectedTask){
                            TaskRow(task: task)
                        }
                    }.onDelete(perform: deleteTask)
                }
            }
        }
    }
    
    func addTask(){
        if !newTaskTitle.isEmpty{
            tasks.append(Task(id: UUID(), title: newTaskTitle, description: newTaskDescription, dueDate: newTaskDate))
            
            newTaskTitle = ""
            newTaskDescription = ""
            newTaskDate = Date()
        }
    }
    
    func deleteTask(at offset: IndexSet){
        tasks.remove(atOffsets: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskManagementView()
    }
}
