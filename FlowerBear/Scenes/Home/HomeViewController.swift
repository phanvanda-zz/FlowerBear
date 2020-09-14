//
//  HomeViewController.swift
//  FlowerBear
//
//  Created by Da on 9/13/20.
//  Copyright © 2020 . All rights reserved.
//

import UIKit
import Reusable

final class HomeViewController: UIViewController, BindableType, UIScrollViewDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Properties
    
    var viewModel: HomeViewModel!
    var searchBarAnimationing = false
    private var lastContentOffset: CGFloat = 0
    
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
        title = TabbarItemType.home.title
        scrollView.delegate = self
    }

    func bindViewModel() {
        let input = HomeViewModel.Input()
        let output = viewModel.transform(input)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (self.lastContentOffset > scrollView.contentOffset.y)
        && scrollView.contentOffset.y < scrollView.contentSize.height
        && scrollView.contentOffset.y > 0 {
            // move up
            print("up")
            print(scrollView.contentOffset.y)
            showSearchBar(isShow: false)
        }
        else if (self.lastContentOffset < scrollView.contentOffset.y)
            && scrollView.contentOffset.y < scrollView.contentSize.height
            && scrollView.contentOffset.y > 0 {
            // move down
            print("down")
            print(scrollView.contentOffset.y)
            showSearchBar(isShow: true)
        }
        
        // update the new position acquired
        self.lastContentOffset = scrollView.contentOffset.y
    }
    
    func showSearchBar(isShow: Bool) {
        self.searchView.isHidden = isShow
//        if !searchBarAnimationing {
//            searchBarAnimationing = true
//            UIView.animate(
//                withDuration: 2,
//                delay: 0,
//                options: .layoutSubviews,
//                animations: {
//                    self.searchView.isHidden = isShow
//            },
//                completion: { _ in
//                    self.searchBarAnimationing = false
//            })
//        }
    }
}

// MARK: - Binders
extension HomeViewController {

}

// MARK: - StoryboardSceneBased
extension HomeViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.main
}
