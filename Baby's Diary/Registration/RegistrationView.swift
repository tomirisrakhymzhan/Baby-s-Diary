//
//  RegistrationView.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 25/07/2024.
//

import UIKit

class RegistrationView: UIView {

    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()

    let title : UILabel = {
        let label = UILabel()
        label.text = String(localized: "Registration_Title")
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()

    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder =  String(localized: "Email")
        textField.keyboardType = .emailAddress
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 5
        textField.returnKeyType = .done
        return textField
    }()
    
    let emailErrorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 12)
        label.isHidden = true
        return label
    }()

    let passwordTextField1: UITextField = {
        let textField = UITextField()
        textField.placeholder = String(localized: "Password")
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 5
        textField.returnKeyType = .done
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let toggleButton1: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        button.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        button.tintColor = .systemPurple
        return button
    }()
        
    let passwordTextField2: UITextField = {
        let textField = UITextField()
        textField.placeholder = String(localized: "Repeat_Password")
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 5
        textField.isSecureTextEntry = true
        textField.returnKeyType = .done
        return textField
    }()
    
    let toggleButton2: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        button.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        button.tintColor = .systemPurple
        return button
    }()
        
    let passwordErrorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 12)
        label.isHidden = true
        return label
    }()

    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(String(localized: "Register"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 5
        return button
    }()
    
    let generalErrorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 12)
        label.isHidden = true
        return label
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    let signUpStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    let haveAccountLabel: UILabel = {
        let label = UILabel()
        label.text = String(localized: "Have_Account")
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(String(localized: "Sign_In"), for: .normal)
        button.setTitleColor(.systemPurple, for: .normal)
        button.backgroundColor = .none
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(){
        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        backgroundColor = .white
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(title)
        mainStackView.addArrangedSubview(emailTextField)
        mainStackView.addArrangedSubview(emailErrorLabel)
        mainStackView.addArrangedSubview(passwordTextField1)
        passwordTextField1.rightView = toggleButton1
        passwordTextField1.rightViewMode = .always
        mainStackView.addArrangedSubview(passwordTextField2)
        passwordTextField2.rightView = toggleButton2
        passwordTextField2.rightViewMode = .always
        mainStackView.addArrangedSubview(passwordErrorLabel)
        mainStackView.addArrangedSubview(registerButton)
        mainStackView.addArrangedSubview(generalErrorLabel)
        addSubview(dividerView)
        signUpStackView.addArrangedSubview(haveAccountLabel)
        signUpStackView.addArrangedSubview(signInButton)
        addSubview(signUpStackView)
    }

    private func setupConstraints() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        signUpStackView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50),
            
            registerButton.heightAnchor.constraint(equalToConstant: 40),
                    
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            dividerView.bottomAnchor.constraint(equalTo: signUpStackView.topAnchor, constant: -8),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            
            signUpStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            signUpStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        haveAccountLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        haveAccountLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        
    }

}
