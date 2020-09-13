//
//  AppNavigator.swift
//  FlowerBear
//
//  Created by Da on 9/10/20.
//  Copyright © 2020 . All rights reserved.
//

import UIKit

protocol AppNavigatorType {
    func toLogin()
}

struct AppNavigator: AppNavigatorType {
    unowned let assembler: Assembler
    unowned let window: UIWindow
    
    func toLogin() {
        let nav = UINavigationController()
        let vc: LoginViewController = assembler.resolve(navigationController: nav)
        nav.viewControllers.append(vc)
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
}
