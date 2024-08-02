//
//  ForgotPasswordViewController.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 02/08/2024.
//

import UIKit
import SwiftMessages

class ForgotPasswordViewController: UIViewController, UITextFieldDelegate {
    
    weak var router: RouterProtocol?
    let forgotPasswordView = ForgotPasswordView()
    var email : String?
    let viewModel = ForgotPasswordViewModel()
    
    init(email: String?) {
        super.init(nibName: nil, bundle: nil)
        self.email = email
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = forgotPasswordView
        forgotPasswordView.emailTextField.text = email
    }
    
    override func viewDidLoad() {
        setupActions()

    }
    
    private func setupActions() {
        forgotPasswordView.sendPasswordLinkButton.addTarget(self, action: #selector(sendPasswordLinkButtonPressed), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
        forgotPasswordView.emailTextField.delegate = self
    }
    
    @objc func sendPasswordLinkButtonPressed(){
        print("sendPasswordLinkButtonPressed")
        guard let email = forgotPasswordView.emailTextField.text, !email.isEmpty else {
            showMessage(String(localized: "Enter_Your_Email"), type: .error)
            return
        }
        
        viewModel.sendPasswordResetLink(email: email) { [weak self] result in
            switch result {
            case .success(let message):
                self?.showMessage(message, type: .success)
            case .failure(let error):
                self?.showMessage(error.localizedDescription, type: .error)
            }
        }
    }
    
    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    private func showMessage(_ message: String, type: Theme) {
        let messageView = MessageView.viewFromNib(layout: .messageView)
        messageView.configureTheme(type)
        messageView.configureContent(title: "", body: message)
        var config = SwiftMessages.defaultConfig
        config.duration = .seconds(seconds: 3)
        SwiftMessages.show(config: config, view: messageView)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // hide  keyboard when "Done" is tapped
        textField.resignFirstResponder()
        return true
    }

}
