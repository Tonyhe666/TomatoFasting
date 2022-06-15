//
//  AppAction.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/12.
//

import Foundation

struct User{
    
}

enum AppError: Error {
    
}

enum AppAction {
    case login(phoneNumber: String, verifyCode: String) // 异步操作,所以对应有一个登录完成
    case loginComplete(Result<User, AppError>)
    case logout
}
