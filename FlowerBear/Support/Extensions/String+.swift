//
//  String+.swift
//  FlowerBear
//
//  Created by phan.van.da on 9/11/20.
//  Copyright © 2020 phan.van.da. All rights reserved.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self) && self.count < 255
    }
    
    func isValidPassword() -> Bool {
        return self.count < 50 && !self.isEmpty && self.count > 6
    }
    
    static var emailError: String {
        return "Vui lòng nhập đúng định dạng email"
    }
    
    static var passwordError: String {
        return "Vui lòng nhập mật khẩu dài hơn 6 ký tự và ít hơn 30 ký tự"
    }
}

