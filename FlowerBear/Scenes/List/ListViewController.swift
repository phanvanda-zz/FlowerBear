//
//  ListViewController.swift
//  FlowerBear
//
//  Created by Da on 9/13/20.
//  Copyright © 2020 . All rights reserved.
//

import UIKit
import Reusable

final class ListViewController: UIViewController, BindableType {
    
    // MARK: - IBOutlets
    
    // MARK: - Properties
    
    var viewModel: ListViewModel!

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
        title = TabbarItemType.list.title
    }

    func bindViewModel() {
        let input = ListViewModel.Input()
        let output = viewModel.transform(input)
    }
}

// MARK: - Binders
extension ListViewController {

}

// MARK: - StoryboardSceneBased
extension ListViewController: StoryboardSceneBased {
        static var sceneStoryboard = Storyboards.main
}
