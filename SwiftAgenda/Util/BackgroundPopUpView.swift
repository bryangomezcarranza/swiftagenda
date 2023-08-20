//
//  BackgroundPopUpView.swift
//  SwiftAgenda
//
//  Created by Bryan Gomez on 8/19/23.
//

import SwiftUI

/// Craetes a background that is completely see through
struct ClearBackgroundView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) { }
}
