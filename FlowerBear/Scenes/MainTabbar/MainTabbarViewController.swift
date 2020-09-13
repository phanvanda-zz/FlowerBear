//
//  MainTabbarViewController.swift
//  FlowerBear
//
//  Created by Da on 9/13/20.
//  Copyright © 2020 . All rights reserved.
//

import UIKit
import Reusable

final class MainTabbarViewController: UITabBarController, BindableType {
    
    // MARK: - IBOutlets
    
    // MARK: - Properties
    
    var viewModel: MainTabbarViewModel!

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }

    deinit {
        logDeinit()
    }
    
    // MARK: - Methods

    private func configView() {
        tabBar.do {
            $0.shadowImage = UIImage()
            $0.backgroundImage = UIImage()
//            $0.barTintColor = UIColor.white
            $0.tintColor = UIColor.black
            $0.isTranslucent = false
        }
        
        viewControllers = viewModel.navigator.getTabbarNavigations()
    }

    func bindViewModel() {
        let input = MainTabbarViewModel.Input()
        let _ = viewModel.transform(input)
    }
}

// MARK: - Binders
extension MainTabbarViewController {

}

// MARK: - StoryboardSceneBased
extension MainTabbarViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.main
}

extension MainTabbarViewController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let index = self.tabBar.items?.firstIndex(of: item), index != selectedIndex {
            let subView = tabBar.subviews[index + 1]
            performSpringAnimation(imgView: subView)
        }
    }
    
    private func performSpringAnimation(imgView: UIView) {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0.5,
            options: .curveEaseInOut,
            animations: {
                    imgView.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
                //reducing the size
                UIView.animate(withDuration: 0.5,
                               delay: 0.2,
                               usingSpringWithDamping: 0.5,
                               initialSpringVelocity: 0.5,
                               options: .curveEaseInOut,
                               animations: {
                                imgView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                }) { (flag) in
            }
        }) { (flag) in
            
        }
    }
}
