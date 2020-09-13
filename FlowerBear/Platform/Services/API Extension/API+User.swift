//
//  API+User.swift
//  FlowerBear
//
//  Created by phan.van.da on 9/11/20.
//  Copyright © 2020 phan.van.da. All rights reserved.
//

import ObjectMapper

// MARK: Login
extension API {
    final class LoginInput: APIInput {
        init(email: String, password: String) {
            let param = [
                "email": email,
                "password": password
                
            ]
            
            super.init(urlString: API.Urls.endPoint(.login),
                       parameters: param,
                       requestType: .post,
                       requireAccessToken: false)
        }
    }
    
    final class LoginOutput: APIOutput {
        private(set) var user: UserModel?
        
        override func mapping(map: Map) {
            super.mapping(map: map)
            user <- map["data"]
        }
    }
    
    func login(_ input: LoginInput) -> Observable<LoginOutput> {
        return request(input)
    }
}
