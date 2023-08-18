//
//  PriorityFilterView.swift
//  SwiftAgenda
//
//  Created by Bryan Gomez on 8/17/23.
//

import SwiftUI

struct SAPriorityFilterView: View {
    
    let priorities = ["All", "High", "Medium", "Low"]
    @Binding var selectedPriority: String
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(priorities, id:\.self) { priority in
                    Text(priority)
                        .monospaced()
                        .font(.system(size:12))
                        .frame(minWidth: 60)
                        .frame(minHeight: 20)
                        .padding(6)
                        .foregroundColor(selectedPriority == priority ? .white : .black)
                        .background(selectedPriority == priority ? .black : Color.secondary.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                        .onTapGesture {
                            selectedPriority = priority
                        }
                }
                
            }.padding()
        }
    }
}

#Preview {
    SAPriorityFilterView(selectedPriority: .constant("High"))
}
