//
//  Repository.swift
//  FlowerBear
//
//  Created by phan.van.da on 9/11/20.
//  Copyright © 2020 phan.van.da. All rights reserved.
//

import Foundation

protocol RepositoriesAssembler {
    func resolve() -> UserRepositoryType
}

extension RepositoriesAssembler where Self: DefaultAssembler {
    func resolve() -> UserRepositoryType {
        return UserRepository()
    }
}
