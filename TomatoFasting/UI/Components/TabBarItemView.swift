//
//  TabBarItemView.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/19.
//

import SwiftUI

struct TabBarItemView: View {
    var tab: Tab
    @Binding var selectedTab: Tab
    var body: some View {
        Button {
            selectedTab = tab
        } label: {
            VStack(spacing: 0) {
                Image(selectedTab == tab ? tab.iconSelect : tab.iconNormal)
                Text(tab.title)
                    .foregroundColor(selectedTab == tab ? Color.color333 : Color.color666)
                    .titleFont(size: 12, weight: .regular)
                    .padding(.top,2)
                Spacer()
            }
        }
        .accentColor(.color333)
        .padding(.top, 4)
        //.background(Color.red)
    }
}

struct TabBarItemView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarItemView(tab: .plan, selectedTab: .constant(.plan))
    }
}
