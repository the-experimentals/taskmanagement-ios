//
//  Task.swift
//  TaskManagement
//
//  Created by Bibek Saini on 2023-09-26.
//

import Foundation

struct Task: Identifiable, Hashable{
    let id:UUID
    let title: String
    let description: String
    let dueDate: Date
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
