//
//  Font.swift
//  SwiftAgenda
//
//  Created by Bryan Gomez on 8/19/23.
//

import SwiftUI


extension Font {
    static func brandBold(size: CGFloat) -> Font {
        .brand(size: size, weight: .bold)
    }
    
    static func brand(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        let weightSuffix = {
            switch weight {
            case .bold: return "Bold"
            case .medium: return "Medium"
            case .regular: return "Regular"
            case .light: return "Light"
            default:
                assertionFailure("Unregistered font weight! \(weight)")
                return "Regular"
            }
        }()
        return .custom("Poppins-\(weightSuffix)", size: size)
    }
}
