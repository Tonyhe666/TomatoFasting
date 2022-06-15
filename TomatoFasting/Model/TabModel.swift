//
//  TabModel.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/13.
//

import Foundation
import SwiftUI

enum Tab: Identifiable, CaseIterable, Hashable {
    var id: UUID {
        return UUID()
    }
    case plan
    case fasting
    case record
    case trend
    
    var title: String {
        switch self {
        case .plan:
            return "计划"
        case .fasting:
            return "断食"
        case .record:
            return "记录"
        case .trend:
            return "统计"
        }
    }
    
    var iconNormal: String {
        switch self {
        case .plan:
            return "tab_plan_normal"
        case .fasting:
            return "tab_fasting_normal"
        case .record:
            return "tab_record_normal"
        case .trend:
            return "tab_trend_normal"
        }
    }
    
    var iconSelect: String {
        switch self {
        case .plan:
            return "tab_plan_select"
        case .fasting:
            return "tab_fasting_select"
        case .record:
            return "tab_record_select"
        case .trend:
            return "tab_trend_select"
        }
    }
}

