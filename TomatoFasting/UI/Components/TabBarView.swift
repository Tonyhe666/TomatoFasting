//
//  TabBarView.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/19.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedTab: Tab
    @EnvironmentObject var store: Store
    var body: some View {
        GeometryReader { proxy in
            let hasHomeIndicatior = proxy.safeAreaInsets.bottom > 0
            
            VStack {
                //Spacer()
                HStack(spacing: 0) {
                    if store.appState.tabBar.isShowFasting {
                        TabBarItemView(tab: .fasting, selectedTab: $selectedTab)
                            .frame(width: proxy.size.width / 3.0)
                            .task {
                                selectedTab = .fasting
                            }
                    } else {
                        TabBarItemView(tab: .plan, selectedTab: $selectedTab)
                            .frame(width: proxy.size.width / 3.0)
                            .task {
                                selectedTab = .plan
                            }
                    }
                    TabBarItemView(tab: .record, selectedTab: $selectedTab)
                        .frame(width: proxy.size.width / 3.0)
                    TabBarItemView(tab: .trend, selectedTab: $selectedTab)
                        .frame(width: proxy.size.width / 3.0)
                }
                .frame(maxWidth: .infinity)
                .frame(height: hasHomeIndicatior ? 65 : 49)
                //.background(Color.colorD8)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selectedTab: .constant(.plan))
            .environmentObject(Store())
    }
}
