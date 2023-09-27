//
//  TaskDetail.swift
//  TaskManagement
//
//  Created by Bibek Saini on 2023-09-26.
//

import Foundation
import SwiftUI

struct TaskDetail : View {
    let task: Task
    
    var body: some View{
        VStack(alignment: .leading, spacing: 16){
            Text(task.title).font(.largeTitle)
            
            VStack(alignment: .leading, spacing: 8){
                Text("Description: ").font(.headline)
                Text(task.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(nil)
            }
            
            VStack(alignment: .leading, spacing: 8){
                Text("Due Date").font(.headline)
                Text(task.dueDate, style: .date)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding(16)
        .navigationTitle("Task Details")
    }
}
