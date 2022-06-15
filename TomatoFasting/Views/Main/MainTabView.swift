//
//  MainTabBarView.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/13.
//

import SwiftUI

struct MainTabView: View {
    
    @State var indexType: Tab = .plan
    init() {
        // this is not the same as manipulating the proxy directly
//        let appearance = UINavigationBarAppearance()
//        
//        // this overrides everything you have set up earlier.
//        appearance.configureWithTransparentBackground()
//        
//        // this only applies to big titles
//        appearance.largeTitleTextAttributes = [
//            .font : UIFont.systemFont(ofSize: 22, weight: .semibold),
//            NSAttributedString.Key.foregroundColor : UIColor.color333
//        ]
//        // this only applies to small titles
//        appearance.titleTextAttributes = [
//            .font : UIFont.systemFont(ofSize: 16),
//            NSAttributedString.Key.foregroundColor : UIColor.color333
//        ]
//        
//        //In the following two lines you make sure that you apply the style for good
//        UINavigationBar.appearance().scrollEdgeAppearance = appearance
//        UINavigationBar.appearance().standardAppearance = appearance
//        
//        // This property is not present on the UINavigationBarAppearance
//        // object for some reason and you have to leave it til the end
//        UINavigationBar.appearance().tintColor = .white
    }
    var body: some View {
        NavigationView {
            TabView(selection: $indexType)  {
                PlanListView()
                    .tabItem {
                        Image(indexType == .plan ? Tab.plan.iconSelect : Tab.plan.iconNormal)
                        Text(Tab.plan.title)
                            .foregroundColor(.red)
                    }
                    .tag(Tab.plan)
                RecordView()
                    .tabItem {
                        Image(indexType == .record ? Tab.record.iconSelect : Tab.record.iconNormal)
                        Text(Tab.record.title)
                    }
                    .tag(Tab.record)
                TrendView()
                    .tabItem {
                        Image(indexType == .trend ? Tab.trend.iconSelect : Tab.trend.iconNormal)
                        Text(Tab.trend.title)
                    }
                    .tag(Tab.trend)
            }
            .accentColor(Color("Color333"))
        }
        .navigationViewStyle(.stack)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(Store())
    }
}
