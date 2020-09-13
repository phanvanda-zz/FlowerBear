//
//  LoginViewController.swift
//  FlowerBear
//
//  Created by Da on 9/11/20.
//  Copyright © 2020 . All rights reserved.
//

import UIKit
import Reusable

final class LoginViewController: UIViewController, BindableType {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var shadownLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Properties
    
    var viewModel: LoginViewModel!

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }

    deinit {
        logDeinit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Methods

    private func configView() {
        view.backgroundColor = .background
        titleLabel.textColor = .textMain
        shadownLabel.do {
            $0.textColor = .textMain
            $0.alpha = 0.5
        }
        
        emailTextField.do {
            $0.addBorder()
            $0.setLeftPaddingPoints(10)
            $0.textColor = .textMain
            $0.placeholder = "Email"
        }
        
        passwordTextField.do {
            $0.addBorder()
            $0.setLeftPaddingPoints(10)
            $0.textColor = .textMain
            $0.placeholder = "Mật khẩu"
        }
        
        loginButton.do {
            $0.backgroundColor = .button
            $0.addBorder()
            $0.setTitleColor(.textMain, for: .normal)
            $0.setTitle("Đăng nhập", for: .normal)
        }
    }
    
    func bindViewModel() {
        let input = LoginViewModel.Input(
            emailTrigger: emailTextField.rx.text.orEmpty.asDriver(),
            paswordTrigger: passwordTextField.rx.text.orEmpty.asDriver(),
            loginTrigger: loginButton.rx.tap.asDriverOnErrorJustComplete()
        )
        
        let output = viewModel.transform(input)
        
        output.error
            .drive(rx.error)
            .disposed(by: rx.disposeBag)
        
        output.loading
            .drive(rx.isLoading)
            .disposed(by: rx.disposeBag)
        
        output.login
            .drive()
            .disposed(by: rx.disposeBag)
        
        output.validateEmail
            .drive(validateEmailBinder)
            .disposed(by: rx.disposeBag)
        
        output.vaidaltePassword
            .drive(validatePasswordBinder)
            .disposed(by: rx.disposeBag)
    }
}

// MARK: - Binders
extension LoginViewController {
    var validateEmailBinder: Binder<Bool> {
        return Binder(self) { viewController, validate in
            if !validate {
                viewController.showError(message: .emailError)
            }
        }
    }
    
    var validatePasswordBinder: Binder<Bool> {
        return Binder(self) { viewController, validate in
            if !validate {
                viewController.showError(message: .passwordError)
            }
        }
    }
}


// MARK: - StoryboardSceneBased
extension LoginViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.login
}
