//
//  OffsetYModifier.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/14.
//

import SwiftUI

struct OffsetYModifier: ViewModifier {
    
    @Binding var offset:CGFloat
    func body(content: Content) -> some View {
        content.overlay(
            GeometryReader{ proxy in
                let minY = proxy.frame(in: .named("scroll")).minY
                Color.clear.preference(key: ScrollPreferenceKey.self, value: minY)
            }.onPreferenceChange(ScrollPreferenceKey.self) { value in
                offset = value
            }
        )
    }
}
