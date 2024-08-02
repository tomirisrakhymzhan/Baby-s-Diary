//
//  ForgotPasswordView.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 02/08/2024.
//

import UIKit

class ForgotPasswordView : UIView {
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Сброс пароля"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .default
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 5
        textField.returnKeyType = .done
        return textField
    }()
    
    let sendPasswordLinkButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Отправить ссылку для сброса"
        configuration.baseBackgroundColor = .systemPurple
        configuration.baseForegroundColor = .white
        configuration.cornerStyle = .medium
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        
        let button = UIButton(configuration: configuration)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return button
    }()
    
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
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
        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(emailTextField)
        mainStackView.addArrangedSubview(sendPasswordLinkButton)
        addSubview(mainStackView)
    }
    
    private func setupConstraints() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        sendPasswordLinkButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            sendPasswordLinkButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
  
}
