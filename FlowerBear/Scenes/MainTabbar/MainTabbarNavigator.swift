//
//  MainTabbarNavigator.swift
//  FlowerBear
//
//  Created by Da on 9/13/20.
//  Copyright © 2020 . All rights reserved.
//

protocol MainTabbarNavigatorType {
    func getTabbarNavigations() -> [UIViewController]
}

enum TabbarItemType: Int {
    case home
    case list
    case noti
    case user
    
    var title: String {
        switch self {
        case .home:
            return "Trang chủ"
        case .list:
            return "Danh mục"
        case .noti:
            return "Thông báo"
        case .user:
            return "Tài khoản"
        }
    }
}

struct MainTabbarNavigator: MainTabbarNavigatorType {
    unowned let assembler: Assembler
    
    func getTabbarNavigations() -> [UIViewController] {
        
        let homeNavigation = BaseNavigationController()
        
        let listNavigation = BaseNavigationController()
        
        let notiNavigation = BaseNavigationController()
        
        let userNavigation = BaseNavigationController()
        
        let homeVC: HomeViewController = assembler.resolve(navigationController: homeNavigation)
        homeNavigation.isNavigationBarHidden = true
        homeNavigation.pushViewController(homeVC, animated: false)
        
        let listVC: ListViewController = assembler.resolve(navigationController: listNavigation)
        listNavigation.isNavigationBarHidden = true
        listNavigation.pushViewController(homeVC, animated: false)
        
        let notiVC: NotiViewController = assembler.resolve(navigationController: notiNavigation)
        notiNavigation.isNavigationBarHidden = true
        notiNavigation.pushViewController(homeVC, animated: false)
        
        let userVC: UserViewController = assembler.resolve(navigationController: userNavigation)
        userNavigation.isNavigationBarHidden = true
        userNavigation.pushViewController(homeVC, animated: false)
        
        return [
            homeVC,
            listVC,
            notiVC,
            userVC
        ]
        
    }
    
}
