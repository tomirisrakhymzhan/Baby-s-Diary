//
//  SignInView.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 19/07/2024.
//

import UIKit

class SignInView: UIView {
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()

    let title : UILabel = {
        let label = UILabel()
        label.text = String(localized: "Authorization_Title")
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
        label.text = ""
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 12)
        label.isHidden = true
        return label
    }()

    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = String(localized: "Password")
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 5
        textField.returnKeyType = .done
        
        // toggle password button
        let toggleButton = UIButton(type: .custom)
        toggleButton.setImage(UIImage(systemName: "eye"), for: .normal)
        toggleButton.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        toggleButton.tintColor = .systemPurple
        toggleButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        textField.rightView = toggleButton
        textField.rightViewMode = .always
        
        return textField
        }()
        
    let passwordErrorLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 12)
        label.isHidden = true
        return label
    }()

    let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(String(localized: "Sign_In"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 5
        return button
    }()
    
    let generalErrorLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 12)
        label.isHidden = true
        return label
    }()

    let forgotPasswordButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(String(localized: "Forgot_Password"), for: .normal)
        button.setTitleColor(.systemPurple, for: .normal)
        button.backgroundColor = .none
        button.contentHorizontalAlignment = .right
        return button
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5 // Adjust color as needed
        return view
    }()
    
    let registerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    let noAccountLabel: UILabel = {
        let label = UILabel()
        label.text = String(localized: "No_Account")
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(String(localized: "Register"), for: .normal)
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
        mainStackView.addArrangedSubview(passwordTextField)
        mainStackView.addArrangedSubview(passwordErrorLabel)
        mainStackView.addArrangedSubview(signInButton)
        mainStackView.addArrangedSubview(generalErrorLabel)
        mainStackView.addArrangedSubview(forgotPasswordButton)
        addSubview(dividerView)
        registerStackView.addArrangedSubview(noAccountLabel)
        registerStackView.addArrangedSubview(registerButton)
        addSubview(registerStackView)
    }

    private func setupConstraints() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        registerStackView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50),
            
            signInButton.heightAnchor.constraint(equalToConstant: 40),
                    
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            dividerView.bottomAnchor.constraint(equalTo: registerStackView.topAnchor, constant: -8),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            
            registerStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            registerStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        noAccountLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        noAccountLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        
    }
    
    @objc private func togglePasswordVisibility(_ sender: UIButton) {
        sender.isSelected.toggle()
        passwordTextField.isSecureTextEntry.toggle()
    }
}

