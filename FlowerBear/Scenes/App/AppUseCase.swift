//
//  AppUseCase.swift
//  FlowerBear
//
//  Created by Da on 9/10/20.
//  Copyright © 2020 . All rights reserved.
//

protocol AppUseCaseType {
    func getToken() -> String?
}

struct AppUseCase: AppUseCaseType {
    func getToken() -> String? {
        return AppSettings.user?.token
    }
}
