//
//  RegistrationConfirmationView.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 25/07/2024.
//
import UIKit

class RegistrationConfirmationView: UIView {

    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "example@gmail.com"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.text = String(localized: "Confirm_Email")
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let sendLinkButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = String(localized: "Send_Confirmation_Email")
        configuration.baseBackgroundColor = .systemPurple
        configuration.baseForegroundColor = .white
        configuration.cornerStyle = .medium
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        
        let button = UIButton(configuration: configuration)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return button
    }()
    
    let verifiedLabel: UILabel = {
        let label = UILabel()
        label.text = String(localized: "Already_Confirmed")
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let checkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(String(localized: "Check"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.systemPurple, for: .normal)
        return button
    }()
    
    let alreadyConfirmedStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(String(localized: "Exit"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.systemPurple, for: .normal)
        return button
    }()
    
    let leftLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    let rightLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    let signOutStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        backgroundColor = .white
        addSubview(contentStackView)
        contentStackView.addArrangedSubview(emailLabel)
        contentStackView.addArrangedSubview(messageLabel)
        contentStackView.addArrangedSubview(sendLinkButton)
        contentStackView.addArrangedSubview(alreadyConfirmedStackView)
        alreadyConfirmedStackView.addArrangedSubview(verifiedLabel)
        alreadyConfirmedStackView.addArrangedSubview(checkButton)
        addSubview(signOutStackView)
        signOutStackView.addArrangedSubview(leftLineView)
        signOutStackView.addArrangedSubview(logoutButton)
        signOutStackView.addArrangedSubview(rightLineView)
    }
    
    private func setupConstraints() {
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        sendLinkButton.translatesAutoresizingMaskIntoConstraints = false
        signOutStackView.translatesAutoresizingMaskIntoConstraints = false
        leftLineView.translatesAutoresizingMaskIntoConstraints = false
        rightLineView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            contentStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            sendLinkButton.heightAnchor.constraint(equalToConstant: 44),
            
            signOutStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            signOutStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            signOutStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            leftLineView.heightAnchor.constraint(equalToConstant: 1),
            rightLineView.heightAnchor.constraint(equalToConstant: 1),
            leftLineView.widthAnchor.constraint(equalTo: rightLineView.widthAnchor),
        ])
    }
}
