//
//  RegistrationConfirmationViewController.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 25/07/2024.
//
import UIKit
import FirebaseAuth
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
        guard let user = Auth.auth().currentUser else {
            showMessage("Пользователь не найден", type: .error)
            return
        }

        user.sendEmailVerification { [weak self] (error) in
            if let error = error {
                self?.showMessage(error.localizedDescription, type: .error)
                return
            }
            self?.showMessage("Ссылка для подтверждения отправлена на вашу почту.", type: .success)
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
            do {
                try Auth.auth().signOut()
                self?.router?.showSignIn()
            } catch {
                self?.showMessage("Не удалось выйти из аккаунта.", type: .error)
            }
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
