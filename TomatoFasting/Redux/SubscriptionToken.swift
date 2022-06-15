//
//  SubscriptionToken.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/12.
//

import Foundation
import Combine

// 当一个异步请求执行的时候,Combine 不存储的话,会被自动取消,导致异步执行失败,这里模仿Combine自己方式,当执行的时候,store一下token. 执行完成时候,unStore下,保证资源及时释放.

class SubscriptionToken {
    var cancellable: AnyCancellable?
    func unStore() {
        cancellable = nil
    }
}

extension AnyCancellable {
    func store(in token: SubscriptionToken) {
        token.cancellable = self
    }
}
