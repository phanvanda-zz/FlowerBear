//
//  NotiViewController.swift
//  FlowerBear
//
//  Created by Da on 9/13/20.
//  Copyright © 2020 . All rights reserved.
//

import UIKit
import Reusable

final class NotiViewController: UIViewController, BindableType {
    
    // MARK: - IBOutlets
    
    // MARK: - Properties
    
    var viewModel: NotiViewModel!

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
        title = TabbarItemType.noti.title
    }

    func bindViewModel() {
        let input = NotiViewModel.Input()
        let output = viewModel.transform(input)
    }
}

// MARK: - Binders
extension NotiViewController {

}

// MARK: - StoryboardSceneBased
extension NotiViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.main
}
