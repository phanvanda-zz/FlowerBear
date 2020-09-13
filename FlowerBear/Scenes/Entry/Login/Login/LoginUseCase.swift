//
//  LoginUseCase.swift
//  FlowerBear
//
//  Created by Da on 9/11/20.
//  Copyright © 2020 . All rights reserved.
//

protocol LoginUseCaseType {
    func validateEmail(_ emailStr: String) -> Bool
    func validatePassword(_ passWordStr: String) -> Bool
    func login(email: String, password: String) -> Observable<UserModel>
    func save(user: UserModel)
}

struct LoginUseCase: LoginUseCaseType {
    let userRepository: UserRepositoryType
    
    func validateEmail(_ emailStr: String) -> Bool {
        return emailStr.isValidEmail()
    }
    
    func validatePassword(_ passWordStr: String) -> Bool {
        return passWordStr.isValidPassword()
    }
    
    func login(email: String, password: String) -> Observable<UserModel> {
        return userRepository.login(email: email, password: password)
    }
    
    func save(user: UserModel) {
        AppSettings.user = user
    }

}
