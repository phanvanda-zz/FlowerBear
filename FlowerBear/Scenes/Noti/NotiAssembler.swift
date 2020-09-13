//
//  NotiAssembler.swift
//  FlowerBear
//
//  Created by Da on 9/13/20.
//  Copyright © 2020 . All rights reserved.
//

import UIKit

protocol NotiAssembler {
    func resolve(navigationController: UINavigationController) -> NotiViewController
    func resolve(navigationController: UINavigationController) -> NotiViewModel
    func resolve(navigationController: UINavigationController) -> NotiNavigatorType
    func resolve() -> NotiUseCaseType
}

extension NotiAssembler {
    func resolve(navigationController: UINavigationController) -> NotiViewController {
        let vc = NotiViewController.instantiate()
        let vm: NotiViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }

    func resolve(navigationController: UINavigationController) -> NotiViewModel {
        return NotiViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension NotiAssembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> NotiNavigatorType {
        return NotiNavigator(assembler: self, navigationController: navigationController)
    }

    func resolve() -> NotiUseCaseType {
        return NotiUseCase()
    }
}