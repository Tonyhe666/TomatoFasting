//
//  Store.swift
//  TomatoFasting
//
//  Created by heliang on 2022/6/12.
//

import Combine

/*
1. 将 app 当作一个状态机，状态决定用户界面。
2. 这些状态都保存在一个 Store 对象中。
3. View 不能直接操作 State，而只能通过发送 Action 的方式，间接改变存储在
Store 中的 State。
4. Reducer 接受原有的 State 和发送过来的 Action，生成新的 State。
5. 用新的 State 替换 Store 中原有的状态，并用新状态来驱动更新界面。
 */



// ObservableObject view可以通过@ObservedObject 或者 @EnvironmentObject 来订阅
class Store: ObservableObject {
    // 2
    @Published var appState = AppState()
    
    // 3
    func dispatchAction(_ action: AppAction) {
        debugPrint("action: \(action)")
        let state = Store.reduce(state: appState, action: action)
        
        // 5
        appState = state.0
        
        // 6
        if let command = state.1 {
            debugPrint("AppCommand \(command)")
            command.excute(in: self)
        }
    }
    
    // 4
    private static func reduce(state: AppState, action: AppAction) -> (AppState, AppCommand?) {
        var appState = state
        var appCommond: AppCommand?
        switch action {
        case .login(let phoneNumber, let verifyCode):
            appCommond = LoginAppCommand(phoneNumber: phoneNumber, verifyCode: verifyCode)
        case .logout:
            break
        case .loginComplete(let result):
            switch result {
            case .success(let user):
                break
            case .failure(let error):
                debugPrint(error)
            }
        }
        return (appState, appCommond) // 此处有待商榷, 因为@Published修饰的变量,发生变化时候,Combine会通知订阅者,此处返回的意义,感觉不是很大.
    }
}
