//
//  ListAssembler.swift
//  FlowerBear
//
//  Created by Da on 9/13/20.
//  Copyright © 2020 . All rights reserved.
//

import UIKit

protocol ListAssembler {
    func resolve(navigationController: UINavigationController) -> ListViewController
    func resolve(navigationController: UINavigationController) -> ListViewModel
    func resolve(navigationController: UINavigationController) -> ListNavigatorType
    func resolve() -> ListUseCaseType
}

extension ListAssembler {
    func resolve(navigationController: UINavigationController) -> ListViewController {
        let vc = ListViewController.instantiate()
        let vm: ListViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }

    func resolve(navigationController: UINavigationController) -> ListViewModel {
        return ListViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension ListAssembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> ListNavigatorType {
        return ListNavigator(assembler: self, navigationController: navigationController)
    }

    func resolve() -> ListUseCaseType {
        return ListUseCase()
    }
}