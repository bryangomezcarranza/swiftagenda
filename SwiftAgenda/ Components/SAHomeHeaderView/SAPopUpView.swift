//
//  SAPopUpView.swift
//  SwiftAgenda
//
//  Created by Bryan Gomez on 8/19/23.
//

import SwiftUI

struct SAPopUpView: View {
    
    var item: ToDoItem
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        ZStack {
            
            Color.gray.opacity(0.0).ignoresSafeArea(.all)
            
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 270, height: 100)
                .overlay {
                    VStack {
                        HStack {
                            Text("priority level: " + item.priority)
                                .font(.brand(size: 8))
                                .foregroundStyle(Color.white)
                                .padding(.horizontal)
                            Spacer()
                            Image(systemName: "xmark")
                                .foregroundStyle(Color.white)
                                .onTapGesture {
                                    dismiss()
                                }
                                .padding(.horizontal)
                        }
                        VStack(alignment: .center) {
                            Text("your note")
                                .font(.brand(size: 12))
                                .foregroundStyle(Color.white)
                            Text(item.notes)
                                .lineLimit(4)
                                .font(.brand(size: 12, weight: .light))
                                .foregroundStyle(Color.white)
                        }
                        .padding(.bottom)
                        .padding(.horizontal)
                    }
                }
        } .background(ClearBackgroundView())
    }
}
