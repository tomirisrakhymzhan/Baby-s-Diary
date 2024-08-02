//
//  RegistrationConfirmationViewController.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 25/07/2024.
//
import UIKit
import SwiftMessages
import Combine


class RegistrationConfirmationViewController: UIViewController {

    weak var router: RouterProtocol?
    let registrationConfirmationView = RegistrationConfirmationView()
    let viewModel = RegistrationConfirmationViewModel()
    private var cancellables = Set<AnyCancellable>()

    override func loadView() {
        view = registrationConfirmationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        setupActions()
        
    }
    
    private func setupBindings(){
        viewModel.emailAddress
            .receive(on: DispatchQueue.main)
            .sink { [weak self] email in
                self?.registrationConfirmationView.emailLabel.text = email
            }
            .store(in: &cancellables)
    }

    private func setupActions() {
        registrationConfirmationView.sendLinkButton.addTarget(self, action: #selector(sendLinkButtonPressed), for: .touchUpInside)
        registrationConfirmationView.logoutButton.addTarget(self, action: #selector(logoutButtonPressed), for: .touchUpInside)
        registrationConfirmationView.checkButton.addTarget(self, action: #selector(checkButtonPressed), for: .touchUpInside)
    }

    @objc func sendLinkButtonPressed() {
        viewModel.sendConfirmationEmail { [weak self] result in
            switch result {
            case .success(let message):
                self?.showMessage(message, type: .success)
            case .failure(let error):
                self?.showMessage(error.localizedDescription, type: .error)
            }
        }
    }
    
    @objc private func checkButtonPressed() {
        viewModel.checkEmailVerified { [weak self] isVerified in
            if isVerified {
                self?.showMessage("Ваша почта успешно подтверждена.", type: .success)
            } else {
                self?.showMessage("Почта еще не подтверждена.", type: .warning)
            }
        }
    }

    @objc func logoutButtonPressed() {
        router?.showConfirmationAlert(title: "Вы уверены что хотите выйти?", message: "Это действие необратимо") { [weak self] in
            self?.router?.showSignIn()
        }
    }

    private func showMessage(_ message: String, type: Theme) {
        let messageView = MessageView.viewFromNib(layout: .cardView)
        messageView.configureTheme(type)
        messageView.configureContent(title: "", body: message)
        var config = SwiftMessages.defaultConfig
        config.duration = .seconds(seconds: 3)
        SwiftMessages.show(config: config, view: messageView)
    }
}
