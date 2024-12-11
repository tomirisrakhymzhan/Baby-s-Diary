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
    lazy var registrationConfirmationView : RegistrationConfirmationView = {
       return RegistrationConfirmationView()
    }()
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
    
    private func setupBindings() {
        viewModel.$emailAddress
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
        viewModel.sendConfirmationEmail()
            .sink(receiveCompletion: { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.showMessage(error.localizedDescription, type: .error)
                }
            }, receiveValue: { [weak self] message in
                self?.showMessage(message, type: .success)
            })
            .store(in: &cancellables)
    }
    
    @objc private func checkButtonPressed() {
        viewModel.checkEmailVerified()
            .sink(receiveCompletion: { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.showMessage(error.localizedDescription, type: .error)
                }
            }, receiveValue: { [weak self] isVerified in
                if isVerified {
                    self?.showMessage(String(localized: "Email_Verified_Message"), type: .success)
                    self?.router?.showSignIn()
                } else {
                    self?.showMessage(String(localized: "Email_Not_Yet_Verified_Message"), type: .warning)
                }
            })
            .store(in: &cancellables)
    }
    
    @objc func logoutButtonPressed() {
        router?.showConfirmationAlert(title: String(localized: "Are_Sure_You_Want_Exit"), message: String(localized: "Onboarding_Alert_Message")) { [weak self] in
            self?.viewModel.signOut()
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
