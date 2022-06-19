//
//  TitleModifier.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/19.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    var size: Double = 22
    var weight: Font.Weight = .regular
    func body(content: Content) -> some View {
        content
            .font(.system(size: size).weight(weight))
            .foregroundColor(.color333)
    }
}

extension View {
    func titleFont(size: Double, weight: Font.Weight = .regular) -> some View {
        self.modifier(TitleModifier(size: size, weight: weight))
    }
}
