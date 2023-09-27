//
//  TaskRow.swift
//  TaskManagement
//
//  Created by Bibek Saini on 2023-09-26.
//

import Foundation
import SwiftUI

struct TaskRow : View{
    
    let task: Task
    
    var body: some View{
        HStack{
            Text(task.title)
            Spacer()
            Text(task.dueDate, style: .date)
        }
    }
    
}
