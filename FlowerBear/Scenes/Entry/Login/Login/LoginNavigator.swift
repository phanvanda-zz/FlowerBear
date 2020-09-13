//
//  LoginNavigator.swift
//  FlowerBear
//
//  Created by Da on 9/11/20.
//  Copyright © 2020 . All rights reserved.
//

protocol LoginNavigatorType {

}

struct LoginNavigator: LoginNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
}