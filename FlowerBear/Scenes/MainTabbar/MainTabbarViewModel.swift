//
//  MainTabbarViewModel.swift
//  FlowerBear
//
//  Created by Da on 9/13/20.
//  Copyright © 2020 . All rights reserved.
//

struct MainTabbarViewModel {
    let navigator: MainTabbarNavigatorType
    let useCase: MainTabbarUseCaseType
}

// MARK: - ViewModelType
extension MainTabbarViewModel: ViewModelType {
    struct Input {

    }

    struct Output {

    }

    func transform(_ input: Input) -> Output {
        return Output()
    }
}