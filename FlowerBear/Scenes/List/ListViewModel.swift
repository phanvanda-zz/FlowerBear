//
//  ListViewModel.swift
//  FlowerBear
//
//  Created by Da on 9/13/20.
//  Copyright © 2020 . All rights reserved.
//

struct ListViewModel {
    let navigator: ListNavigatorType
    let useCase: ListUseCaseType
}

// MARK: - ViewModelType
extension ListViewModel: ViewModelType {
    struct Input {

    }

    struct Output {

    }

    func transform(_ input: Input) -> Output {
        return Output()
    }
}