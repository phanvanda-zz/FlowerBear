//
//  LoginViewModel.swift
//  FlowerBear
//
//  Created by Da on 9/11/20.
//  Copyright © 2020 . All rights reserved.
//

struct LoginViewModel {
    let navigator: LoginNavigatorType
    let useCase: LoginUseCaseType
}

// MARK: - ViewModelType
extension LoginViewModel: ViewModelType {
    struct Input {
        let emailTrigger: Driver<String>
        let paswordTrigger: Driver<String>
        let loginTrigger: Driver<Void>
    }

    struct Output {
        let error: Driver<Error>
        let validateEmail: Driver<Bool>
        let vaidaltePassword: Driver<Bool>
        let loading: Driver<Bool>
        let login: Driver<Void>
    }

    func transform(_ input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
        
        let validateEmail = input.loginTrigger
            .withLatestFrom(input.emailTrigger)
            .map { (email) -> Bool in
                self.useCase.validateEmail(email)
            }
        
        let validatePassword = input.loginTrigger
            .withLatestFrom(input.paswordTrigger)
            .map { (password) -> Bool in
                self.useCase.validatePassword(password)
            }
        
        let checkValidate = Driver.combineLatest(validateEmail, validatePassword) { $0 && $1 }
        
        let userInfo = Driver.combineLatest(
            input.emailTrigger,
            input.paswordTrigger
        )
        
        let login = input.loginTrigger
            .withLatestFrom(checkValidate)
//            .filter { $0 }
            .withLatestFrom(userInfo)
            .flatMapLatest { (email, password) -> Driver<UserModel> in
                self.useCase.login(email: email, password: password)
                    .trackError(errorTracker)
                    .trackActivity(activityIndicator)
                    .asDriverOnErrorJustComplete()
            }.do(onNext: { user in
                self.useCase.save(user: user)
                self.navigator.toMain()
                print("Bingo")
            })
            .mapToVoid()
        
        
        return Output(error: errorTracker.asDriver(),
                      validateEmail: validateEmail,
                      vaidaltePassword: validatePassword,
                      loading: activityIndicator.asDriver(),
                      login: login)
    }
}
