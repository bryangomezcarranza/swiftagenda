//
//  SAHomeView.swift
//  SwiftAgenda
//
//  Created by Bryan Gomez on 8/17/23.
//

import SwiftUI

struct SAHomeView: View {
    
    @State private var selectedCategory: String = "All"
    
    var body: some View {
        VStack{
            //Header
            SAHomeHeaderView()
            
            // PriorityFilterView
            SAPriorityFilterView(selectedPriority: $selectedCategory)
                .padding(.horizontal)
           
            // Todos
            
            // Create Button
            
        }
    }
}

#Preview {
    SAHomeView()
}
