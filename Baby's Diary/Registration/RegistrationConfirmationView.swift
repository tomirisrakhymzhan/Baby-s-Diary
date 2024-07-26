//
//  RegistrationConfirmationView.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 25/07/2024.
//

import UIKit

class RegistrationConfirmationView: UIView {

    let message : UILabel = {
        let label = UILabel()
        label.text = "Пожалуйста подтвердите свой адрес электронной почты"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        backgroundColor = .white
        addSubview(message)
    }
    
    func setupConstraints(){
        message.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            message.centerXAnchor.constraint(equalTo: centerXAnchor),
            message.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

}
