//
//  UIColor+.swift
//  FlowerBear
//
//  Created by phan.van.da on 9/11/20.
//  Copyright © 2020 phan.van.da. All rights reserved.
//

import Foundation

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    class var background: UIColor {
        return UIColor(rgb: 0xFFEFFF)
    }
    
    class var textMain: UIColor {
        return UIColor(rgb: 0xA7D9C9)
    }
    
    class var subMain: UIColor {
        return UIColor(rgb: 0xBEEDE5)
    }
    
    class var contentMain: UIColor {
        return UIColor(rgb: 0xE0F8F8)
    }
    
    class var button: UIColor {
        return UIColor(rgb: 0xF6F7FB)
    }
}
