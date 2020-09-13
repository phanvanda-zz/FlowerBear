//
//  AppViewModel.swift
//  FlowerBear
//
//  Created by Da on 9/10/20.
//  Copyright © 2020 . All rights reserved.
//

struct AppViewModel {
    let navigator: AppNavigatorType
    let useCase: AppUseCaseType
}

// MARK: - ViewModelType
extension AppViewModel: ViewModelType {
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    struct Output {
        let toLogin: Driver<Void>
    }
    
    func transform(_ input: Input) -> Output {
        
        let toLogin = input.loadTrigger
            .do(onNext: { _ in
                guard let _ = self.useCase.getToken() else {
                    self.navigator.toLogin()
                    return
                }
                self.navigator.toLogin()
                // go Home Screen
            })
        
        return Output(
            toLogin: toLogin
        )
    }
}
