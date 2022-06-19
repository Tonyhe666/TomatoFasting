//
//  DailyFastingView.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/13.
//

import SwiftUI

struct DailyFastingView: View {
    @EnvironmentObject var store: Store
    @State var isPushPlanList = false
    @State var alpha: Double = 0
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                ScrollDetection(alpha: $alpha, colors: [0xFEF7BF, 0xFFFFFF])
                LazyVStack(alignment: .leading, spacing: 20) {
                    NavigationLink(isActive: $isPushPlanList) {
                        PlanListView()
                    } label: {
                        FastingHeaderView(planName: .constant("16-8"), isPushPlanList: $isPushPlanList)
                    }
                    
                    fastingClockView
                    //dailyPlanSection
                    //KnowledgeSection
                }
                
            }
            .coordinateSpace(name: "scroll")
            .navigationBarHidden(true)
            .overlay(
                NavigationBar(title: "正在断食...", alpha: $alpha)
            ).edgesIgnoringSafeArea(.top)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
    }
    
    var fastingClockView: some View {
        ZStack(alignment: .center) {
            VStack {
                HStack {
                    Image("icon_clock_left")
                        .offset(y:20)
                    Spacer()
                    Image("icon_clock_header")
                    Spacer()
                    Image("icon_clock_right")
                        .offset(y:20)
                }
                .padding(.horizontal, 46)
                Spacer()
            }
            Image("icon_clock_bg")
                .scaledToFit()
                .overlay(
                    VStack(spacing: 2) {
                        HStack(spacing: 2) {
                            Image("icon_lightning")
                            Text("16-8")
                        }
                        Text("00:00:00")
                            .font(.system(size: 30).weight(.heavy).monospacedDigit())
                            .foregroundColor(.color333)
                            .frame(height: 38)
                        Text("已完成: 80%")
                            .titleFont(size: 14, weight: .medium)
                        
                    }
                )
                .padding(.top, 30)
            
            VStack {
                Spacer()
                Button(action: {
                    debugPrint("结束断食")
                }, label: {
                    Text("结束断食")
                        .titleFont(size: 14, weight: .medium)
                        .frame(width: 143, height: 40)
                        .background(Color(0xFFE72C))
                        .cornerRadius(20)
                })
            }
            .offset(y: 20)
        }.frame(maxWidth: .infinity)
            .padding(.bottom, 20)
    }
}

struct DailyFastingView_Previews: PreviewProvider {
    static var previews: some View {
        DailyFastingView()
    }
}
