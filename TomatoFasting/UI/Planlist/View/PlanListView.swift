//
//  PlanListView.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/13.
//

import SwiftUI
import ACarousel

struct PlanListView: View {
    @State var selectPage: Int = 0
    @State var alpha: Double = 0
    @StateObject private var vm  = PlanListViewModel()
    @State var isShowFasting = false
    @EnvironmentObject var store: Store
    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 116, maximum: 252), spacing: 16),
        GridItem(.adaptive(minimum: 116, maximum: 252), spacing: 16),
        GridItem(.adaptive(minimum: 116, maximum: 252), spacing: 16)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                ScrollDetection(alpha: $alpha, colors: [0xFFCEC8, 0xFFFFFF])
                LazyVStack(alignment: .leading) {
                    //header
                    PlanListHeaderView(vm: vm)
                    dailyPlanSection
                    KnowledgeSection
                }
            }
            .coordinateSpace(name: "scroll")
            .navigationBarHidden(true)
            .overlay(
                NavigationBar(title: "断食计划", alpha: $alpha)
            ).edgesIgnoringSafeArea(.top)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
       
        
    }
    
    var dailyPlanSection: some View {
        Section(header:
                    Text("精选日计划")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.color333)
                    .padding(EdgeInsets(top: 30, leading: 20, bottom: 20, trailing: 0))
        ) {
            LazyVGrid(columns: columns, spacing: 25) {
                ForEach(vm.dailyPlans)  { i in
                    PlanUnitView(model: i)
                        .onTapGesture {
                            withAnimation {
                                store.dispatchAction(.showFasting(show: true))
                            }
                        }
                }
            }
            .padding(.leading, 16)
            .padding(.trailing, 16)
        }
//        .sheet(isPresented: $isShowFasting, onDismiss: {
//
//        }, content: {
//            DailyFastingView()
//        })
//        .fullScreenCover(isPresented: $isShowFasting) {
//
//        } content: {
//            DailyFastingView()
//        }

    }
    
    var KnowledgeSection: some View {
        Section(header:
                    Text("断食小知识")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.color333)
                    .padding(EdgeInsets(top: 30, leading: 20, bottom: 20, trailing: 0))
        ) {
            KnowledgeLib()
                .padding(.bottom, 20)
                .onTapGesture {
                    let isShow = store.appState.tabBar.isShowTab
                    store.dispatchAction(.showTabBar(show: !isShow))
                }
        }
    }
}

struct PlanListView_Previews: PreviewProvider {
    static var previews: some View {
        PlanListView()
            .environmentObject(Store())
    }
}
