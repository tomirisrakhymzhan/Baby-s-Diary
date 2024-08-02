//
//  SignInViewController.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 19/07/2024.
//

import UIKit
import Combine

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    weak var router : RouterProtocol?
    private let signInView = SignInView()
    private let loadingView = LoadingView(message: String(localized: "Authorization_Title") + "...")
    private let viewModel = SignInViewModel()
    private var cancellables = Set<AnyCancellable>()

    override func loadView() {
        view = signInView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTapGesture()
        setupActions()
        setupBindings()
        setupTextFieldDelegates()
    }

    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    private func setupActions() {
        signInView.signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        signInView.forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        signInView.registerButton.addTarget(self, action: #selector(registerButtonButtonTapped), for: .touchUpInside)
    }

    @objc private func signInButtonTapped() {
        viewModel.signIn()
    }

    @objc private func forgotPasswordButtonTapped() {
        print("forgotPasswordButtonTapped")
        router?.showForgotPasswordView(email: viewModel.email)
    }

    @objc private func registerButtonButtonTapped() {
        print("registerButtonButtonTapped")
        router?.showRegistration()
    }

    private func setupBindings() {
        viewModel.$emailError
            .sink { [weak self] error in
                self?.signInView.emailErrorLabel.text = error
                self?.signInView.emailErrorLabel.isHidden = error == nil
            }
            .store(in: &cancellables)
        
        viewModel.$passwordError
            .sink { [weak self] error in
                self?.signInView.passwordErrorLabel.text = error
                self?.signInView.passwordErrorLabel.isHidden = error == nil
            }
            .store(in: &cancellables)
        
        viewModel.$generalError
            .sink { [weak self] error in
                self?.signInView.generalErrorLabel.text = error
                self?.signInView.generalErrorLabel.isHidden = error == nil
            }
            .store(in: &cancellables)
        
        viewModel.$isLoading
            .sink { [weak self] isLoading in
                if let view = self?.view {
                    if isLoading {
                        self?.loadingView.show(on: view)
                    } else {
                        self?.loadingView.hide()
                    }
                }
            }
            .store(in: &cancellables)
        
        viewModel.$isSignInSuccessful
            .sink { [weak self] isSuccess in
                if isSuccess {
                    // use router here
                    self?.router?.showAddBabyForm()
                }
            }
            .store(in: &cancellables)
        
        signInView.emailTextField.addTarget(self, action: #selector(emailTextFieldChanged), for: .editingChanged)
        signInView.passwordTextField.addTarget(self, action: #selector(passwordTextFieldChanged), for: .editingChanged)
    }

    @objc private func emailTextFieldChanged() {
        viewModel.email = signInView.emailTextField.text ?? ""
    }

    @objc private func passwordTextFieldChanged() {
        viewModel.password = signInView.passwordTextField.text ?? ""
    }
    
    private func setupTextFieldDelegates() {
        signInView.emailTextField.delegate = self
        signInView.passwordTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // hide  keyboard when "Done" is tapped
        textField.resignFirstResponder()
        return true
    }
}
