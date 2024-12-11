//
//  LabeledTextField.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 09/07/2024.
//

import UIKit

class LabeledTextFieldView: UIView {
    
    private let label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.systemPurple.withAlphaComponent(0.1)
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    init(labelText: String, keyboardType: UIKeyboardType) {
        super.init(frame: .zero)
        label.text = labelText
        textField.keyboardType = keyboardType
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        addSubview(label)
        addSubview(textField)
    }
    
    private func setupConstraints(){
        label.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 4),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
            textField.heightAnchor.constraint(equalToConstant: 40),

        ])
    }
}
