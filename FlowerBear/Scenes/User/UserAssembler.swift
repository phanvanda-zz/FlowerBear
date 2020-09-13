//
//  UserAssembler.swift
//  FlowerBear
//
//  Created by Da on 9/13/20.
//  Copyright © 2020 . All rights reserved.
//

import UIKit

protocol UserAssembler {
    func resolve(navigationController: UINavigationController) -> UserViewController
    func resolve(navigationController: UINavigationController) -> UserViewModel
    func resolve(navigationController: UINavigationController) -> UserNavigatorType
    func resolve() -> UserUseCaseType
}

extension UserAssembler {
    func resolve(navigationController: UINavigationController) -> UserViewController {
        let vc = UserViewController.instantiate()
        let vm: UserViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }

    func resolve(navigationController: UINavigationController) -> UserViewModel {
        return UserViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension UserAssembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> UserNavigatorType {
        return UserNavigator(assembler: self, navigationController: navigationController)
    }

    func resolve() -> UserUseCaseType {
        return UserUseCase()
    }
}