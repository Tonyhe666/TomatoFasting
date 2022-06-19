//
//  PlanListViewModel.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/15.
//

import Foundation

class PlanListViewModel: ObservableObject {
    //var dailyPlans: [DailyPlan] = [.level12_12, .level14_10, .level16_8, .level18_6, .level20_4, .level23_1]
    
    let dailyPlans: [DailyPlanModel] = [
        DailyPlanModel(dailyPlanType: .level12_12),
        DailyPlanModel(dailyPlanType: .level14_10),
        DailyPlanModel(dailyPlanType: .level16_8),
        DailyPlanModel(dailyPlanType: .level18_6),
        DailyPlanModel(dailyPlanType: .level20_4),
        DailyPlanModel(dailyPlanType: .level23_1)
    ]
    
    let banners: [PlanListBannerModel] = [
        PlanListBannerModel(title: "5-2周计划固定断食", desc: "一周断食2天,5天正常吃饭", img: "icon_12_12"),
        PlanListBannerModel(title: "4-3周计划固定断食", desc: "一周断食3天,4天正常吃饭", img: "icon_12_12"),
        PlanListBannerModel(title: "专属周计划断食", desc: "根据您的情况,量身定做的周计划,让你自信吃,快速瘦!", img: "icon_12_12"),
        PlanListBannerModel(title: "自定义周计划", desc: "想怎么断食,就怎么断食,自定义周计划,解决您的断食选择烦恼", img: "icon_12_12")
    ]
    
    init() {
        
    }

}
