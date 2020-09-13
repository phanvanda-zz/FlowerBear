//
//  HomeNavigator.swift
//  FlowerBear
//
//  Created by Da on 9/13/20.
//  Copyright © 2020 . All rights reserved.
//

protocol HomeNavigatorType {

}

struct HomeNavigator: HomeNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
}