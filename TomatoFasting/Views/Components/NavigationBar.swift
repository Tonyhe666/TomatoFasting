//
//  NavigationBar.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/14.
//

import SwiftUI

struct NavigationBar: View {
    var title = ""
    @Binding var contentHasScrolled: Bool
    
    var body: some View {
        ZStack {
            Color.white
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                //.background(.ultraThinMaterial)
                .ignoresSafeArea()
                .frame(maxHeight: .infinity, alignment: .top)
                //.blur(radius: contentHasScrolled ? 10 : 0)
                .opacity(contentHasScrolled ? 1 : 0)
            
            Text(title)
                .animatableFont(size: contentHasScrolled ? 16 : 22, weight: .bold)
                .foregroundStyle(.primary)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: contentHasScrolled ? .top : .topLeading)
                .padding(.horizontal, 20)
                .padding(.top, contentHasScrolled ? 24 : 44)
                .opacity(contentHasScrolled ? 0.7 : 1)
        }
//        .offset(y: model.showNav ? 0 : -120)
//        .accessibility(hidden: !model.showNav)
        .offset(y: contentHasScrolled ? -16 : 0)
        //.border(.red, width: 1)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: "测试",contentHasScrolled: .constant(false))
            .preferredColorScheme(.light)
            //.environmentObject(Model())
    }
}

