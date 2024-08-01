//
//  LoadingView.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 15/07/2024.
//

import UIKit

class LoadingView: UIView {

    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        return indicator
    }()
    
    private let loadingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    init(message: String) {
        super.init(frame: .zero)
        loadingLabel.text = message
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
        backgroundColor = UIColor(white: 0, alpha: 0.5)
        addSubview(activityIndicator)
        addSubview(loadingLabel)
    }
    
    private func setupConstraints() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            loadingLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingLabel.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: 16)
        ])
    }
    
    func show(on view: UIView) {
        frame = view.bounds
        view.addSubview(self)
    }
    
    func hide() {
        removeFromSuperview()
    }
}
