//
//  DailyPlanView.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/13.
//

import SwiftUI

struct DailyPlanView: View {
    var dailyPlan: DailyPlan
    var body: some View {
        VStack {
            Image(dailyPlan.model.icon)
            Text(dailyPlan.model.name)
                .font(.system(size: 16, weight: .bold).monospacedDigit())
                .foregroundColor(.color333)
                .padding(.bottom, 2)
            Text(dailyPlan.model.title)
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(.color666)
                .padding(.bottom, 8)
        }
        .background(Color(dailyPlan.model.color))
        .frame(width: 104)
        .cornerRadius(32)
    }
}

struct DailyPlanView_Previews: PreviewProvider {
    static var previews: some View {
        DailyPlanView(dailyPlan: .level23_1)
    }
}
