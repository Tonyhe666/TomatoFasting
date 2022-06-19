//
//  NavigationBar.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/14.
//

import SwiftUI

struct NavigationBar: View {
    var title = ""
    @Binding var alpha: Double
    
    var body: some View {
        ZStack {
            Color.white
                .frame(maxWidth: .infinity)
                .frame(height: 88)
                //.background(.ultraThinMaterial)
                .frame(maxHeight: .infinity, alignment: .top)
                //.blur(radius: contentHasScrolled ? 10 : 0)
                //.opacity(alpha)
            
            Text(title)
                //.animatableFont(size: contentHasScrolled ? 16 : 22, weight: .bold)
                .titleFont(size: 16, weight: .regular)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(.top, 56)
            
            Button {
                
            } label: {
                Image("icon_indicator")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.top, 56)
            .padding(.leading, 16)

        }
        .edgesIgnoringSafeArea(.top)
        .opacity(alpha)
        //.border(.red, width: 1)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: "测试", alpha: .constant(1))

    }
}

