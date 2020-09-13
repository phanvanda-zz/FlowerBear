//
//  AppSettings.swift
//  FlowerBear
//
//  Created by phan.van.da on 9/11/20.
//  Copyright © 2020 phan.van.da. All rights reserved.
//

import Foundation

enum AppSettings {
    static var user: UserModel? {
        get {
            guard let data = UserDefaults.standard.value(forKey: #function) as? JSONDictionary else { return nil }
            return UserModel(JSON: data)
        }
        set {
            UserDefaults.standard.set(newValue?.toJSON(), forKey: #function)
        }
    }
}
