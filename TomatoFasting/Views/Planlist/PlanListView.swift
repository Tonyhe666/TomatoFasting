//
//  PlanListView.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/13.
//

import SwiftUI

struct PlanListView: View {
    @State var selectPage: Int = 0
    @State var contentHasScrolled = false
    @State var offSetY: CGFloat = 0
    @ObservedObject private var vm  = PlanListViewModel()
    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 116, maximum: 252), spacing: 16),
        GridItem(.adaptive(minimum: 116, maximum: 252), spacing: 16),
        GridItem(.adaptive(minimum: 116, maximum: 252), spacing: 16)
    ]
    
    var bgGridientView: some View {
        LinearGradient(colors: [Color(hex: "0xFFCEC8"), Color(hex: "0xFFE8E8")], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 0, y: 1))
            .frame(height: 281)
            .frame(maxHeight: .infinity, alignment: .top)
            .ignoresSafeArea()
    }
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading) {
                ZStack {
                    scrollDetection
                    VStack(alignment: .leading) {
                        Spacer()
                        Text("立即开始你的断食之旅吧")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.color333)
                            .padding(.top, 2)
                            .padding(.leading)
                        
                        TabView(selection: $selectPage) {
                            VStack {
                                Text("这是一个周计划")
                            }
                            //.frame(width: 200)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.orange)
                            .cornerRadius(30)
                            .padding(.leading, 30)
                            .padding(.trailing, 30)
                            
                            Text("这是一个周计划")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(.orange)
                                .cornerRadius(30)
                                .padding(.leading, 30)
                                .padding(.trailing, 30)
                            Text("这是一个周计划")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(.orange)
                                .cornerRadius(30)
                                .padding(.leading, 30)
                                .padding(.trailing, 30)
                        }
                        .background(Color(0xFFE8E8))
//                        .border(.red, width: 1)
                        .tabViewStyle(.page(indexDisplayMode: .always))
                        .frame(height: 160)
                        
                    }
                    .background(
                        bgGridientView
                    )
                }
                .frame(height: 333)
                
                
                Section(header:
                            Text("精选日计划")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.color333)
                            .padding(EdgeInsets(top: 30, leading: 20, bottom: 20, trailing: 0))
                ) {
                    LazyVGrid(columns: columns, spacing: 25) {
                        ForEach(vm.dailyPlans)  { i in
                            DailyPlanView(dailyPlan: i)
                        }
                    }
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                }
                
                Section(header:
                            Text("断食小知识")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.color333)
                            .padding(EdgeInsets(top: 30, leading: 20, bottom: 20, trailing: 0))
                ) {
                    KnowledgeLib()
                        .padding(.bottom, 20)
                }
            }
            
        }
        .coordinateSpace(name: "scroll")
        //.navigationTitle("断食周计划")
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
        .overlay(NavigationBar(title: "断食周计划", contentHasScrolled: $contentHasScrolled))
        .statusBar(hidden: false)
    }
    
    
    var scrollDetection: some View {
        GeometryReader { proxy in
            let offset = proxy.frame(in: .named("scroll")).minY
            Color.clear.preference(key: ScrollPreferenceKey.self, value: offset)
                .frame(height: 0)
        }
        .onPreferenceChange(ScrollPreferenceKey.self) { value in
            withAnimation(.easeInOut) {
                offSetY = value
                debugPrint(offSetY)
                if value < 0 {
                    contentHasScrolled = true
                } else {
                    contentHasScrolled = false
                }
            }
        }
    }
}

struct PlanListView_Previews: PreviewProvider {
    static var previews: some View {
        PlanListView()
    }
}
