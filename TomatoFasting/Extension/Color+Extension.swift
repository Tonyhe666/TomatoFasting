//
//  Color+Extension.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/13.
//

import SwiftUI

extension Color {
    init(hex: String, alpha: Double = 1.0) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (r, g, b) = ((int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (r, g, b) = (int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: alpha
        )
    }
    
    init(_ hexValue: Int, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: CGFloat((hexValue & 0xFF0000) >> 16) / 255.0,
            green: Double((hexValue & 0x00FF00) >> 8) / 255.0,
            blue: Double(hexValue & 0x0000FF) / 255.0,
            opacity: alpha
        )
    }
    
    static var colorMain: Color {
        return Color(0xFF6698)
    }
    
    static var color333: Color {
        return Color(0x333333)
    }
    
    static var color666: Color {
        return Color(0x666666)
    }
    
    static var color777: Color {
        return Color(0x777777)
    }
    
    static var color888: Color {
        return Color(0x888888)
    }
    
    static var color999: Color {
        return Color(0x999999)
    }
    
    static var colorF8: Color {
        return Color(0xF8F8F8)
    }
    
    static var colorD8: Color {
        return Color(0xD8D8D8)
    }
    
    static var colorE5: Color {
        return Color(0xE5E5E5)
    }
    
    static var colorEEE: Color {
        return Color(0xEEEEEE)
    }
}

