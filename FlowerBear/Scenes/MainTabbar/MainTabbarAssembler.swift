//
//  MainTabbarAssembler.swift
//  FlowerBear
//
//  Created by Da on 9/13/20.
//  Copyright © 2020 . All rights reserved.
//

import UIKit

protocol MainTabbarAssembler {
    func resolve() -> MainTabbarViewController
    func resolve() -> MainTabbarViewModel
    func resolve() -> MainTabbarNavigatorType
    func resolve() -> MainTabbarUseCaseType
}

extension MainTabbarAssembler {
    func resolve() -> MainTabbarViewController {
        let vc = MainTabbarViewController.instantiate()
        let vm: MainTabbarViewModel = resolve()
        vc.bindViewModel(to: vm)
        return vc
    }

    func resolve() -> MainTabbarViewModel {
        return MainTabbarViewModel(
            navigator: resolve(),
            useCase: resolve()
        )
    }
}

extension MainTabbarAssembler where Self: DefaultAssembler {
    func resolve() -> MainTabbarNavigatorType {
        return MainTabbarNavigator(assembler: self)
    }

    func resolve() -> MainTabbarUseCaseType {
        return MainTabbarUseCase()
    }
}
