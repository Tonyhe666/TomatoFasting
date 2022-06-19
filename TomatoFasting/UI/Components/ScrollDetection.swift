//
//  ScrollDetecter.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/19.
//

import SwiftUI

struct ScrollDetection: View {
    @Binding var alpha: Double
    var colors: [Int] = [0xFFCEC8, 0xFFFFFF]
    var body: some View {
        GeometryReader { proxy in
            let offset = proxy.frame(in: .named("scroll")).minY
            LinearGradient(gradient: Gradient(colors: colors.map({ Color($0)
            })), startPoint: .top, endPoint: .bottom)
                .frame(height: max(0, 281+offset))
                .frame(maxHeight: .infinity, alignment: .top)
                .ignoresSafeArea()
                .offset(y: -offset)
            
            Color.clear.preference(key: ScrollPreferenceKey.self, value: offset)
                .frame(height: 0)
        }
        .onPreferenceChange(ScrollPreferenceKey.self) { value in
            alpha = max(0, min(-value / 88, 1))
        }
    }
}

struct ScrollDetection_Previews: PreviewProvider {
    
    static var previews: some View {
        ScrollDetection(alpha: .constant(0), colors: [0xFEF7BF, 0xFFFFFF])
    }
}
