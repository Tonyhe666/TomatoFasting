//
//  DailyPlanModel.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/14.
//

import SwiftUI

struct DailyPlanModel: Identifiable {
    var id = UUID()  
    var dailyPlanType: DailyPlan
}

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
    
    var icon: String {
        switch self {
        case .level12_12:
            return "icon_12_12"
        case .level14_10:
            return "icon_14_10"
        case .level16_8:
            return "icon_16_8"
        case .level18_6:
            return "icon_18_6"
        case .level20_4:
            return "icon_20_4"
        case .level23_1:
            return "icon_23_1"
        }
    }
    
    var name: String {
        switch self {
        case .level12_12:
            return "12-12"
        case .level14_10:
            return "14-10"
        case .level16_8:
            return "16-8"
        case .level18_6:
            return "18-6"
        case .level20_4:
            return "20-4"
        case .level23_1:
            return "23-1"
        }
    }
    
    var title: String {
        switch self {
        case .level12_12:
            return "体验模式"
        case .level14_10:
            return "初级模式"
        case .level16_8:
            return "经典模式"
        case .level18_6:
            return "高阶模式"
        case .level20_4:
            return "挑战模式"
        case .level23_1:
            return "终极模式"
        }
    }
    
    var fastingTime: Int {
        switch self {
        case .level12_12:
            return 12
        case .level14_10:
            return 14
        case .level16_8:
            return 16
        case .level18_6:
            return 18
        case .level20_4:
            return 20
        case .level23_1:
            return 23
        }
    }
    
    var bgColor: Int {
        switch self {
        case .level12_12:
            return 0xFFC7C0
        case .level14_10:
            return 0xFFDD92
        case .level16_8:
            return 0x91EFFF
        case .level18_6:
            return 0x88FFBC
        case .level20_4:
            return 0xA5F1D8
        case .level23_1:
            return 0xFFD391
        }
    }
}


