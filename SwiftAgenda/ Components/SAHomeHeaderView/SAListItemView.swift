//
//  SAListItemView.swift
//  SwiftAgenda
//
//  Created by Bryan Gomez on 8/18/23.
//

import SwiftUI

struct SAListItemView: View {
    
    var item = ToDoItem()
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.square" : "square")
                .foregroundStyle(item.isCompleted ? .green : Color.secondary.opacity(0.4))
                .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0)
                .onTapGesture {
                    toggleCompletion()
                }
            
            Text(item.title)
                .font(.brand(size: 16))
                .foregroundStyle(item.isCompleted ? Color(.lightGray) : .black)
        }
        
        
    }
    
    private func toggleCompletion() {
        withAnimation {
            item.isCompleted.toggle()
        }
    }
}

#Preview {
    SAListItemView()
        .modelContainer(for: ToDoItem.self)
}
