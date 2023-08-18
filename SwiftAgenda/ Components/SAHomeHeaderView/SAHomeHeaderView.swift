//
//  SAHomeHeaderView.swift
//  SwiftAgenda
//
//  Created by Bryan Gomez on 8/17/23.
//

import SwiftUI

struct SAHomeHeaderView: View {
    var body: some View {
        
        VStack {
            HStack(alignment: .center, spacing: 24) {
                Image("test")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .background(Color.green)
                    .clipShape(Circle())
                VStack(alignment: .leading){
                    Text("personal to-do's")
                        .font(.system(size: 20, weight: .bold))
                    Text("hope you are achieving all your goals today")
                        .font(.system(size: 12))
                        .foregroundStyle(Color.secondary)
                }
            }
            Divider()
        }
        .padding()
    }
}

#Preview {
    SAHomeHeaderView()
}
