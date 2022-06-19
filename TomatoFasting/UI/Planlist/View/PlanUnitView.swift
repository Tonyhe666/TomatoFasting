//
//  DailyPlanView.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/13.
//

import SwiftUI

struct PlanUnitView: View {
    @State var model: DailyPlanModel
    var body: some View {
        VStack {
            Image(model.dailyPlanType.icon)
            Text(model.dailyPlanType.name)
                .font(.system(size: 16, weight: .bold).monospacedDigit())
                .foregroundColor(.color333)
                .padding(.bottom, 2)
            Text(model.dailyPlanType.title)
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(.color666)
                .padding(.bottom, 8)
        }
        .background(Color(model.dailyPlanType.bgColor))
        .frame(width: 104, height: 124)
        .cornerRadius(32)
    }
}

struct PlanUnitView_Previews: PreviewProvider {
    static var previews: some View {
        PlanUnitView(model: DailyPlanModel(dailyPlanType: .level12_12))
    }
}
