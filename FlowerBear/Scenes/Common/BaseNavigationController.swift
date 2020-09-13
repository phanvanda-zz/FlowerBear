//
//  BaseNavigationController.swift
//  FlowerBear
//
//  Created by phan.van.da on 9/13/20.
//  Copyright © 2020 phan.van.da. All rights reserved.
//

import Foundation

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.do {
            let backImage = UIImage(named: "Launch")?.withRenderingMode(.alwaysOriginal)
            $0.backIndicatorImage = backImage
            $0.backIndicatorTransitionMaskImage = backImage
            $0.tintColor = UIColor.black
            $0.barTintColor = UIColor.red.withAlphaComponent(0.9)
            $0.titleTextAttributes = [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17),
                NSAttributedString.Key.foregroundColor: UIColor.white
            ]
            $0.isTranslucent = false
        }
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: true)
        viewController.removeBackButtonTitle()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
