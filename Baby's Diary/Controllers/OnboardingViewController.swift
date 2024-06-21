//
//  ViewController.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 18/06/2024.
//

import UIKit

class OnboardingViewController: UIViewController {

    var viewModel = OnboardingViewModel()
    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: viewModel.currentPageModel.imageName))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.currentPageModel.title
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()

    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.currentPageModel.description
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
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
    
    private lazy var pageControl: UIPageControl = {
        let control = UIPageControl()
        control.numberOfPages = 3
        control.currentPage = 0
        control.pageIndicatorTintColor = .lightGray
        control.currentPageIndicatorTintColor = .blue
        control.addTarget(self, action: #selector(pageControlValueChanged(_:)), for: .valueChanged)
        return control
    }()
    
    private lazy var nextButton : UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        var config = UIButton.Configuration.filled()
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        button.configuration = config
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var mainStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [imageView, labelsStackView, pageControl, nextButton])
        sv.axis = .vertical
        sv.alignment = .center
        sv.spacing = 20
        return sv
    }()
    
    lazy var rightButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Skip", image: nil, target: self, action: #selector(rightButtonTapped))
        button.tintColor = .systemBlue
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(mainStackView)
        self.navigationItem.rightBarButtonItem = rightButton
    }

    func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            NSLayoutConstraint(item: mainStackView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0),
            mainStackView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20),
            
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalTo: mainStackView.widthAnchor),
            
            nextButton.topAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: pageControl.bottomAnchor, multiplier: 0.5)
        ])
    }
    
    @objc func rightButtonTapped(){
        print("Skip button tapped")
    }
    @objc func pageControlValueChanged(_ sender: UIPageControl) {
        print("page control value changed")
        viewModel.currentPageIndex = sender.currentPage
        updateUI()
    }
    @objc func nextButtonTapped(){
        print("Next button tapped")
        viewModel.nextPage()
        pageControl.currentPage = viewModel.currentPageIndex
        updateUI()

    }
    
    func updateUI() {
        let currentPage = viewModel.pages[viewModel.currentPageIndex]
        titleLabel.text = currentPage.title
        subTitleLabel.text = currentPage.description
        imageView.image = UIImage(named: currentPage.imageName)
    }
    
    
}
