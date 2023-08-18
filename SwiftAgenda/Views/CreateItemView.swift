//
//  CreateItemView.swift
//  SwiftAgenda
//
//  Created by Bryan Gomez on 8/17/23.
//

import SwiftUI

struct CreateItemView: View {
    
    @State private var nameOfItem: String = ""
    @State private var note: String = ""
    @State private var priority: String = ""
    
    @Environment(\.dismiss) private var dismiss
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let data = ["High", "Medium", "Low"]
    
    var body: some View {
        
        NavigationStack {
            VStack(alignment: .leading) {
                LazyVGrid(columns: columns) {
                    ForEach(data, id: \.self) { item in
                        Text(item)
                            .foregroundStyle(priority == item ? .black : .white)
                            .padding()
                            .frame(width: 120)
                            .background(priority == item ? Color.secondary.opacity(0.5) : .black)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                            .foregroundColor(.white)
                            .onTapGesture {
                                priority = item
                            }
                    }
                }
                Spacer()
                Text("how you feel today?")
                    .monospaced()
                TextField("what is there to do?", text: $nameOfItem)
                    .textFieldStyle(.roundedBorder)
                    .monospaced()
                Text("create a swifty note")
                TextField("Tell me... ", text: $note, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .monospaced()
                Spacer()
                
                Button {
                    saveItem()
                } label: {
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundStyle(Color.secondary.opacity(0.2))
                        .overlay {
                            Text("Save")
                                .tint(Color.black)
                                .monospaced()
                                .frame(maxWidth: .infinity)
                                
                        }
                        .frame(width: .infinity, height: 60, alignment: .center)
                }
            }
            .padding()
        }
    }
    
    private func saveItem() {
        dismiss()
    }
}

#Preview {
    CreateItemView()
}