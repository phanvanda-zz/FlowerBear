//
//  ListNavigator.swift
//  FlowerBear
//
//  Created by Da on 9/13/20.
//  Copyright © 2020 . All rights reserved.
//

protocol ListNavigatorType {

}

struct ListNavigator: ListNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
}