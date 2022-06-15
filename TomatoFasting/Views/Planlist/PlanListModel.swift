//
//  DailyPlanModel.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/14.
//

import SwiftUI


enum DailyPlan: Identifiable {
    var id: UUID {
        return UUID()
    }
    struct DailyPlanModel {
        var icon: String
        var name: String
        var title: String
        var color: Int
        var fastingTime: Int // 断食时长
        var eatingTime: Int // 吃饭时长
        
    }
    
    case level12_12
    case level14_10
    case level16_8
    case level18_6
    case level20_4
    case level23_1
    
    var model: DailyPlanModel {
        switch self {
        case .level12_12:
            return DailyPlanModel(icon: "icon_12_12", name: "12-12", title: "体验模式", color: 0xFFC7C0, fastingTime: 12, eatingTime: 12)
        case .level14_10:
            return DailyPlanModel(icon: "icon_14_10", name: "14-10", title: "初级模式", color: 0xFFDD92, fastingTime: 14, eatingTime: 10)
        case .level16_8:
            return DailyPlanModel(icon: "icon_16_8", name: "16-8", title: "经典模式", color: 0x91EFFF, fastingTime: 16, eatingTime: 8)
        case .level18_6:
            return DailyPlanModel(icon: "icon_18_6", name: "18-6", title: "高阶模式", color: 0x88FFBC, fastingTime: 18, eatingTime: 6)
        case .level20_4:
            return DailyPlanModel(icon: "icon_20_4", name: "20-4", title: "挑战模式", color: 0xA5F1D8, fastingTime: 20, eatingTime: 4)
        case .level23_1:
            return DailyPlanModel(icon: "icon_23_1", name: "23-1", title: "终极模式", color: 0xFFD391, fastingTime: 23, eatingTime: 1)
        }
    }
}


