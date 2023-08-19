//
//  CustomDetent.swift
//  SwiftAgenda
//
//  Created by Bryan Gomez on 8/19/23.
//

import SwiftUI

/// Custom Detent 
extension PresentationDetent {
    static let bar = Self.custom(BarDetent.self)
    static let small = Self.height(350)
    static let extraLarge = Self.fraction(0.75)
}

private struct BarDetent: CustomPresentationDetent {
    static func height(in context: Context) -> CGFloat? {
        max(44, context.maxDetentValue * 0.1)
    }
}
