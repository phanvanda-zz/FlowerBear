//
//  UIView+.swift
//  FlowerBear
//
//  Created by phan.van.da on 9/11/20.
//  Copyright © 2020 phan.van.da. All rights reserved.
//

import Foundation

extension UIView {
    func addBorder(borderColor: CGColor = UIColor.textMain.cgColor,
                   cornerRadius: CGFloat = 5,
                   borderWidth: CGFloat = 1,
                   maskedCornres: CACornerMask = [.layerMinXMinYCorner,
                                                  .layerMinXMaxYCorner,
                                                  .layerMaxXMaxYCorner,
                                                  .layerMaxXMinYCorner]) {
        self.do {
            $0.clipsToBounds = true
            $0.layer.borderColor = borderColor
            $0.layer.borderWidth = borderWidth
            $0.layer.cornerRadius = cornerRadius
            $0.layer.maskedCorners = maskedCornres
        }
    }
    
    func dropShadow(color: UIColor,
                    opacity: Float = 0.5,
                    offSet: CGSize,
                    radius: CGFloat = 1,
                    scale: Bool = true) {
        layer.do {
            $0.masksToBounds = false
            $0.shadowColor = color.cgColor
            $0.shadowOpacity = opacity
            $0.shadowOffset = offSet
            $0.shadowRadius = radius
            $0.shadowPath = UIBezierPath(rect: self.bounds).cgPath
            $0.shouldRasterize = true
            $0.rasterizationScale = scale ? UIScreen.main.scale : 1
        }
     }
}
