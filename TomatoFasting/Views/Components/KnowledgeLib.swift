//
//  KnowledgeLib.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/13.
//

import SwiftUI

struct KnowledgeLib: View {
    var body: some View {
        HStack {
            Image("icon_fasting_knowledge")
                .padding(.leading, 16)
            VStack(alignment: .leading) {
                Text("带你快速了解轻断食的意义")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.color333)
                Text("帮你解读关于轻断食的各种疑问呀~")
                    .font(.system(size: 11, weight: .regular))
                    .foregroundColor(.color777)
            }
            .padding(.leading, 13)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color(0xD6E7FF))
        .cornerRadius(24)
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
}

struct KnowledgeLib_Previews: PreviewProvider {
    static var previews: some View {
        KnowledgeLib()
    }
}
