//
//  ViewController.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 18/06/2024.
//

import UIKit

class OnboardingViewController: UIViewController {

    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "baby-icon"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hi there!"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ex."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var labelsStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.alignment = .center
        sv.spacing = 10
        return sv
    }()

    private lazy var mainStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [imageView, labelsStackView])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.alignment = .center
        sv.spacing = 20
        return sv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }

    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(mainStackView)
    }

    func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            NSLayoutConstraint(item: mainStackView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 0.8, constant: 0),
            mainStackView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20),
            
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalTo: mainStackView.widthAnchor)
        ])
    }
}
