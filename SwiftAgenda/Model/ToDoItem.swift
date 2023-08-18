//
//  ToDoItem.swift
//  SwiftAgenda
//
//  Created by Bryan Gomez on 8/17/23.
//

import Foundation
import SwiftData

@Model
final class ToDoItem {
    
    var title: String
    var notes: String
    var timeStamp: Date
    var isCritical: Bool?
    var isCompleted: Bool
    var priority: String
    
    init(title: String = "", notes: String = "", timeStamp: Date = .now, isCritical: Bool = false, isCompleted: Bool = false, priority: String = "All") {
        self.title = title
        self.notes = notes
        self.timeStamp = timeStamp
        self.isCritical = isCritical
        self.isCompleted = isCompleted
        self.priority = priority
    }
    
}
