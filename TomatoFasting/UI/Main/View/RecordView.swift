//
//  RecordView.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/13.
//

import SwiftUI

struct RecordView: View {
    @State var alpha: Double = 0
    var body: some View {
        ScrollView(.vertical) {
//            scrollDetection
//            LazyVStack(alignment: .leading) {
//                //header
//                PlanListHeaderView(vm: vm)
//                dailyPlanSection
//                KnowledgeSection
//            }
            Text("hello word")
        }
        .coordinateSpace(name: "scroll")
        .navigationBarHidden(true)
        .overlay(
            NavigationBar(title: "断食周计划", alpha: $alpha)
        ).edgesIgnoringSafeArea(.top)
    }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
