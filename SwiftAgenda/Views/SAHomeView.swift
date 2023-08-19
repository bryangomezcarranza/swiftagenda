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
    @Environment(\.modelContext) var context
    
    // Computed property to filter out items based on priority
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
                    SAListItemView(item: item)
                    /// Delete from SwiftData container
                        .swipeActions {
                            Button(role: .destructive) {
                                context.delete(item)
                            } label: {
                                Image(systemName: "trash")
                            }
                        }
                }.listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .padding(.horizontal, 5)
            
            Spacer()
            // Create Button
            button.frame(height: 40)
            Spacer(minLength: 30)
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
                        .font(.brand(size: 16))
                        .tint(Color.black)
                }
        }
        .padding(.horizontal)
        .sheet(isPresented: $showCreateSheet, content: {
            NavigationStack {
                CreateItemView()
            }
            .presentationDragIndicator(.visible)
            .presentationDetents([.small]) // uses custom detent
        })
    }
    
    
    
    
}

#Preview {
    SAHomeView()
}
