//
//  PlanListBannerView.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/15.
//

import SwiftUI
import ACarousel

struct PlanListBannerView: View {
    var banners: [PlanListBannerModel]
    @State var index: Int = 0
    var body: some View {
        ACarousel(banners,
                  index: $index,
                  spacing: 16,
                  headspace: 10,
                  sidesScaling: 0.8,
                  isWrap: true,
                  autoScroll: .active(5)) { item in
            
            HStack {
                VStack(alignment: .leading, spacing: 3) {
                    Text(item.title)
                        .font(.system(size: 18).weight(.semibold))
                        .foregroundColor(.color333)
                    Text(item.desc)
                        .font(.system(size: 12).weight(.regular))
                        .foregroundColor(.color333)
                    
                }.padding(.horizontal)
                Image(item.img)
                    .resizable()
                    .scaledToFit()
            }
            .background(Rectangle()
                            .fill(.white)
                            //.border(.red, width: 1)
                            .cornerRadius(30)
            )
        }.frame(height: 160)
        //.border(.black, width: 1)
        
    }
}

struct PlanListBannerView_Previews: PreviewProvider {
    static var previews: some View {
        PlanListBannerView(banners: PlanListViewModel().banners)
            
    }
}
