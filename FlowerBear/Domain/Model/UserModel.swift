//
//  UserModel.swift
//  FlowerBear
//
//  Created by phan.van.da on 9/11/20.
//  Copyright © 2020 phan.van.da. All rights reserved.
//

import Foundation
import ObjectMapper

struct UserModel {
    var name: String
    var email: String
    var password: String
    var token: String
}

extension UserModel {
    init() {
        self.init(name: "",
                  email: "",
                  password: "",
                  token: "")
    }
}

extension UserModel: Mappable {
    init?(map: Map) {
        self.init()
    }
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        email <- map["email"]
        password <- map["password"]
        token <- map["token"]
    }
}

