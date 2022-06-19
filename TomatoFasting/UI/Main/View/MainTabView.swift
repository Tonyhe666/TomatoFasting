//
//  MainTabBarView.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/13.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var store: Store
    @State var selectedTab: Tab = .plan
    var body: some View {
        ZStack {
            Group {
                switch selectedTab {
                case .plan:
                    PlanListView()
                case .fasting:
                    DailyFastingView()
                case .record:
                    RecordView()
                case .trend:
                    TrendView()
                }
            }
            .padding(.bottom, store.appState.tabBar.isShowTab ? 65: 0)
            TabBarView(selectedTab: $selectedTab)
                .opacity(store.appState.tabBar.isShowTab ? 1: 0)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(Store())
    }
}
