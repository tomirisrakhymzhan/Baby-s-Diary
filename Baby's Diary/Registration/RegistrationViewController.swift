//
//  RegistrationViewController.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 25/07/2024.
//

import UIKit
import Combine

class RegistrationViewController: UIViewController, UITextFieldDelegate {

    
    weak var router : RouterProtocol?
    private let registerView = RegistrationView()
    private let loadingView = LoadingView(message: String(localized: "Registration_Title") + "...")
    private let viewModel = RegistrationViewModel()
    private var cancellables = Set<AnyCancellable>()

    override func loadView() {
        view = registerView
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
        registerView.registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        
        registerView.signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    }

    @objc private func registerButtonTapped(){
        viewModel.signUp()
    }
    
    
    @objc private func signInButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    private func setupBindings() {
        viewModel.$emailError
            .sink { [weak self] error in
                self?.registerView.emailErrorLabel.text = error
                self?.registerView.emailErrorLabel.isHidden = error == nil
            }
            .store(in: &cancellables)
        
        viewModel.$passwordError
            .sink { [weak self] error in
                self?.registerView.passwordErrorLabel.text = error
                self?.registerView.passwordErrorLabel.isHidden = error == nil
            }
            .store(in: &cancellables)
        
        viewModel.$generalError
            .sink { [weak self] error in
                self?.registerView.generalErrorLabel.text = error
                self?.registerView.generalErrorLabel.isHidden = error == nil
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
        
        viewModel.$isSignUpSuccessful
            .sink { [weak self] isSuccess in
                if isSuccess {
                    self?.router?.showRegistrationConfirmation()
                }
            }
            .store(in: &cancellables)
        
        registerView.emailTextField.addTarget(self, action: #selector(emailTextFieldChanged), for: .editingChanged)
        registerView.passwordTextField1.addTarget(self, action: #selector(passwordTextField1Changed), for: .editingChanged)
        registerView.passwordTextField2.addTarget(self, action: #selector(passwordTextField2Changed), for: .editingChanged)
        registerView.toggleButton1.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        registerView.toggleButton2.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)

    }

    @objc private func emailTextFieldChanged() {
        viewModel.email = registerView.emailTextField.text ?? ""
    }

    @objc private func passwordTextField1Changed() {
        viewModel.password1 = registerView.passwordTextField1.text ?? ""
    }
    
    @objc private func passwordTextField2Changed() {
        viewModel.password2 = registerView.passwordTextField2.text ?? ""
    }
    
    @objc private func togglePasswordVisibility(_ sender: UIButton) {
        self.registerView.passwordTextField1.isSecureTextEntry.toggle()
        self.registerView.passwordTextField2.isSecureTextEntry.toggle()
    }
    
    private func setupTextFieldDelegates() {
        registerView.emailTextField.delegate = self
        registerView.passwordTextField1.delegate = self
        registerView.passwordTextField2.delegate = self

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // hide  keyboard when "Done" is tapped
        textField.resignFirstResponder()
        return true
    }

}
