//
//  UserRepository.swift
//  FlowerBear
//
//  Created by phan.van.da on 9/11/20.
//  Copyright © 2020 phan.van.da. All rights reserved.
//

import Foundation

protocol UserRepositoryType {
    func login(email: String, password: String) -> Observable<UserModel>
}

struct UserRepository: UserRepositoryType {
    func login(email: String, password: String) -> Observable<UserModel> {
        let input = API.LoginInput(email: email, password: password)
        //        return API.shared.login(input)
        //            .map { output in
        //                guard let user = output.user else {
        //                    throw APIInvalidResponseError()
        //                }
        //
        //                return user
        //        }
        
        return Observable.just(
            UserModel(
                name: "USER 01",
                email: email,
                password: password,
                token: "TOKEN 01"
            )
        )
    }
}
