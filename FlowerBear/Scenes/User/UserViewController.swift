//
//  UserViewController.swift
//  FlowerBear
//
//  Created by Da on 9/13/20.
//  Copyright © 2020 . All rights reserved.
//

import UIKit
import Reusable

final class UserViewController: UIViewController, BindableType {
    
    // MARK: - IBOutlets
    
    // MARK: - Properties
    
    var viewModel: UserViewModel!

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
        title = TabbarItemType.user.title
    }

    func bindViewModel() {
        let input = UserViewModel.Input()
        let output = viewModel.transform(input)
    }
}

// MARK: - Binders
extension UserViewController {

}

// MARK: - StoryboardSceneBased
extension UserViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.main
}
