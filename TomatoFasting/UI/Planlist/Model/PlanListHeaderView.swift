//
//  PlanlistHeaderView.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/19.
//

import SwiftUI

struct PlanListHeaderView: View {
    @StateObject var vm: PlanListViewModel
    var body: some View {
        VStack(alignment: .leading) {
            Text("断食周计划")
                .font(.system(size: 22, weight: .semibold))
                .padding(.leading)
                .padding(.top, 60)
            Text("立即开始你的断食之旅吧")
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.color333)
                .padding(.top, 2)
                .padding(.leading)
            
            PlanListBannerView(banners: vm.banners)
        }
        .frame(height: 300)
    }
}

struct PlanListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        PlanListHeaderView(vm: PlanListViewModel())
    }
}
