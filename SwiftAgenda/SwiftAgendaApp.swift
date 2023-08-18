//
//  SwiftAgendaApp.swift
//  SwiftAgenda
//
//  Created by Bryan Gomez on 8/17/23.
//

import SwiftUI
import SwiftData

@main
struct SwiftAgendaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: ToDoItem.self) // container set up for swift data 
    }
}
