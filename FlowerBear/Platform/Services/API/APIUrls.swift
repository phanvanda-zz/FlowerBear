//
//  APIUrls.swift
//  FlowerBear
//
//  Created by Da on 9/10/20.
//  Copyright © 2020 . All rights reserved.
//

extension API {
    enum Urls {
        static var domainURL = ""
        
        static func endPoint(_ type: EndPoint) -> String {
            let urlString = Urls.domainURL
            return urlString.appending(type.description)
        }
    }
    
    enum EndPoint {
        case login
        
        var description: String {
            switch self {
            case .login:
                return "/user"
            }
        }
    }
}
