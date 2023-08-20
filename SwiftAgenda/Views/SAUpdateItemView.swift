//
//  SAUpdateItemView.swift
//  SwiftAgenda
//
//  Created by Bryan Gomez on 8/20/23.
//

import SwiftUI
import SwiftData

struct SAUpdateItemView: View {
    
    @Bindable var todoItem: ToDoItem
    @Environment(\.dismiss) private var dismiss
    
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let data = ["High", "Medium", "Low"]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text("choose priority level:")
                    .font(.brand(size: 12))
                Spacer()
            }
            LazyVGrid(columns: columns) {
                ForEach(data, id: \.self) { item in
                    Text(item)
                        .foregroundStyle(todoItem.priority == item ? .black : .white)
                        .padding()
                        .frame(width: 120, height: 35)
                        .background(todoItem.priority == item ? Color.secondary.opacity(0.5) : .black)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                        .foregroundColor(.white)
                        .onTapGesture {
                            todoItem.priority = item
                        }
                }
            }
            .padding(.bottom)
            Text("what is there to do?")
                .font(.brand(size: 16))
            TextField("Ex: Gym today", text: $todoItem.title)
                .textFieldStyle(.roundedBorder)
                .font(.brand(size: 16))
            Text("create a swifty note")
            TextField("Tell me... ", text: $todoItem.notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .font(.brand(size: 16))
            Spacer()
            Button {
                saveItem()
            } label: {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(Color.black)
                    .overlay {
                        Text("Update")
                            .foregroundStyle(Color.white)
                            .font(.brand(size: 16))
                            .frame(maxWidth: .infinity)
                            
                    }
                    .frame(height: 40, alignment: .center)
            }
        }
        .padding()

    }
    
    private func saveItem() {
        dismiss()
    }
}

#Preview {
    SAUpdateItemView(todoItem: ToDoItem())
}
