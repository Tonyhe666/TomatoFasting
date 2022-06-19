//
//  FastingHeaderView.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/19.
//

import SwiftUI

struct FastingHeaderView: View {
    @EnvironmentObject var store: Store
    @Binding var planName: String
    @Binding var isPushPlanList: Bool
    var title: String = "当前正在断食"
    var desc: String = "坚持下去才能瘦成一道闪电⚡️"
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .titleFont(size: 22, weight: .semibold)
                    .frame(height: 30)
                Text(desc)
                    .titleFont(size: 16, weight: .regular)
                    .frame(height: 22)
            }
            Spacer()
            Button {
                // 需要去计划列表页,此时为二级页面.所以需要隐藏tabbar
                isPushPlanList = true
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 13)
                        .frame(width: 70, height: 26)
                    .foregroundColor(Color(0xFFE72C))

                    HStack(spacing: 2) {
                        Image("icon_lightning")
                        Text(planName)
                            .font(.system(size: 16).weight(.heavy).monospacedDigit())
                            .foregroundColor(.color333)
                    }
                }
            }

        }
        .padding(.top, 60)
        .padding(.horizontal, 20)
    }
}

struct FastingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FastingHeaderView(planName: .constant("16-8"),
                          isPushPlanList: .constant(false)
        )
            .environmentObject(Store())
    }
}
