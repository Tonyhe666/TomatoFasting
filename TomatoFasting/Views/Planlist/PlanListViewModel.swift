//
//  PlanListViewModel.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/15.
//

import Foundation

class PlanListViewModel: ObservableObject {
    @Published var dailyPlans: [DailyPlan] = [.level12_12, .level14_10, .level16_8, .level18_6, .level20_4, .level23_1]
    
    init() {
        
    }

}
