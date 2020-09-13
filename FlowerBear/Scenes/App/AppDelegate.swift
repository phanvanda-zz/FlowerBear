//
//  AppDelegate.swift
//  FlowerBear
//
//  Created by Da on 9/10/20.
//  Copyright © 2020 . All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var assembler: Assembler = DefaultAssembler()
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        Localize.setCurrentLanguage("ja")

        bindViewModel()
    }

    private func bindViewModel() {
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else { return }
        
        let vm: AppViewModel = assembler.resolve(window: window)
        let input = AppViewModel.Input(
            loadTrigger: Driver.just(())
        )
        let output = vm.transform(input)
        
        output.toLogin
            .drive()
            .disposed(by: rx.disposeBag)
    }
}
