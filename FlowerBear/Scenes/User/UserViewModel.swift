//
//  UserViewModel.swift
//  FlowerBear
//
//  Created by Da on 9/13/20.
//  Copyright © 2020 . All rights reserved.
//

struct UserViewModel {
    let navigator: UserNavigatorType
    let useCase: UserUseCaseType
}

// MARK: - ViewModelType
extension UserViewModel: ViewModelType {
    struct Input {

    }

    struct Output {

    }

    func transform(_ input: Input) -> Output {
        return Output()
    }
}