//
//  NotiNavigator.swift
//  FlowerBear
//
//  Created by Da on 9/13/20.
//  Copyright © 2020 . All rights reserved.
//

protocol NotiNavigatorType {

}

struct NotiNavigator: NotiNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
}