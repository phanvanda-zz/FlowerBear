//
//  APIInput.swift
//  FlowerBear
//
//  Created by Da on 9/10/20.
//  Copyright © 2020 . All rights reserved.
//

import Alamofire

class APIInput: APIInputBase {
    override init(urlString: String,
                  parameters: [String: Any]?,
                  requestType: HTTPMethod,
                  requireAccessToken: Bool) {
        super.init(urlString: urlString,
                   parameters: parameters,
                   requestType: requestType,
                   requireAccessToken: requireAccessToken)
        self.headers = [
            "Content-Type": "application/json; charset=utf-8",
            "Accept": "application/json"
        ]
        self.user = nil
        self.password = nil
    }
}