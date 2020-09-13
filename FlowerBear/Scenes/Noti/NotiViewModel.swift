//
//  NotiViewModel.swift
//  FlowerBear
//
//  Created by Da on 9/13/20.
//  Copyright © 2020 . All rights reserved.
//

struct NotiViewModel {
    let navigator: NotiNavigatorType
    let useCase: NotiUseCaseType
}

// MARK: - ViewModelType
extension NotiViewModel: ViewModelType {
    struct Input {

    }

    struct Output {

    }

    func transform(_ input: Input) -> Output {
        return Output()
    }
}