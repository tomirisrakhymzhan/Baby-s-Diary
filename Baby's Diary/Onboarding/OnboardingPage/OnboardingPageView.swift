//
//  OnboardingView.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 23/06/2024.
//

import UIKit

protocol OnboardingPageViewData {
    var titleText: String { get }
    var descriptionText: String { get }
    var image: String { get }
}

class OnboardingPageView: UIView {

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()

    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = .darkGray
        return label
    }()

    private lazy var labelsStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        sv.axis = .vertical
        sv.alignment = .center
        sv.spacing = 10
        return sv
    }()
    
    private lazy var mainStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [imageView, labelsStackView])
        sv.axis = .vertical
        sv.alignment = .center
        sv.spacing = 30
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        backgroundColor = .white
        addSubview(mainStackView)
    }

    func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            mainStackView.topAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            mainStackView.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor),

            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.5),
            imageView.widthAnchor.constraint(greaterThanOrEqualTo: mainStackView.widthAnchor, multiplier: 1),
            
            subTitleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: mainStackView.leadingAnchor, constant: 20),
            subTitleLabel.trailingAnchor.constraint(greaterThanOrEqualTo: mainStackView.trailingAnchor, constant: -20),
        ])
        
        subTitleLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
        subTitleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        mainStackView.setContentHuggingPriority(.defaultLow, for: .vertical)
        mainStackView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }
    
    func configure(with data: OnboardingPageViewData) {
        titleLabel.text = data.titleText
        subTitleLabel.text = data.descriptionText
        imageView.image = UIImage(named: data.image)
    }
    
}
