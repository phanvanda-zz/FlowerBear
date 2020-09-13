//
//  LoginNavigator.swift
//  FlowerBear
//
//  Created by Da on 9/11/20.
//  Copyright © 2020 . All rights reserved.
//

protocol LoginNavigatorType {
    func toMain()
}

struct LoginNavigator: LoginNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
    
    func toMain() {
        let mainTabbar: MainTabbarViewController = assembler.resolve()
        AppDelegate.shared.window?.rootViewController = mainTabbar
        AppDelegate.shared.window?.makeKeyAndVisible()
    }
}
