//
//  SAHomeView.swift
//  SwiftAgenda
//
//  Created by Bryan Gomez on 8/17/23.
//

import SwiftUI
import SwiftData

struct SAHomeView: View {
    
    //private var todoList: ToDoItem
    @State private var selectedPriority: String = "All"
    @State private var showCreateSheet: Bool = false
    
    @Query private var todoItems: [ToDoItem]
    
    var items: [ToDoItem] {
        if(selectedPriority == "All") {
            return todoItems
        } else {
            // returns the items for the specific category we created
            return todoItems.filter({$0.priority == selectedPriority})
        }
    }
    
    var body: some View {
        VStack{
            //Header
            SAHomeHeaderView()
            // PriorityFilterView
            SAPriorityFilterView(selectedPriority: $selectedPriority)
                .padding(.horizontal)
            // Todos
            List {
                ForEach(items) { item in
                    Text(item.title)
                }
            }
            Spacer()
            // Create Button
            button.frame(height: 40)
        }
    }
    
    var button: some View {
        Button {
            showCreateSheet.toggle()
        } label: {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color.secondary.opacity(0.2))
                .overlay {
                    Text("create to do")
                        .tint(Color.black)
                }
        }
        .padding(.horizontal)
        .sheet(isPresented: $showCreateSheet, content: {
            NavigationStack {
                CreateItemView()
            }
            .presentationDetents([.medium])
        })
    }
}

#Preview {
    SAHomeView()
}
