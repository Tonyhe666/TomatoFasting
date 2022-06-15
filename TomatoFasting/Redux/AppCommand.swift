//
//  AppCommand.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/12.
//

import Foundation
import Combine

protocol AppCommand {
    func excute(in store: Store)
}

// eg:
struct LoginAppCommand: AppCommand {
    var phoneNumber: String
    var verifyCode: String
    func request() -> Future<User, AppError> {
        
        return Future { promise in
            DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                promise(.success(User()))
            }
        }
    }
    
    func excute(in store: Store) {
        let token = SubscriptionToken()
        request()
            .sink { complete in
                switch complete {
                case .failure(let error):
                    debugPrint(error)
                    store.dispatchAction(.loginComplete(.failure(error)))
                case .finished:
                    break
                }
                token.unStore()
            } receiveValue: { user in
                store.dispatchAction(.loginComplete(.success(user)))
            }
            .store(in: token)

    }
}
