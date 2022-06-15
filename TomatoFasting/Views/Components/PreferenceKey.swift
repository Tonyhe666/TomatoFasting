//
//  PreferenceKey.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/14.
//

import SwiftUI

struct ScrollPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
