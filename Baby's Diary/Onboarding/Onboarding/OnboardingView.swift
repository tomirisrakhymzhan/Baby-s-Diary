//
//  OnboardingView.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 23/06/2024.
//
import UIKit

protocol OnboardingViewDelegate: AnyObject {
    func nextTapped()
    func pageControlTapped(at index: Int)
}

class OnboardingView: UIView {
    
    weak var delegate: OnboardingViewDelegate?
    
    lazy var pageViewController: UIPageViewController = {
        let pvc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        return pvc
    }()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = .lightGray
        pc.currentPageIndicatorTintColor = .black
        pc.addTarget(self, action: #selector(pageControlValueChanged(_:)), for: .valueChanged)
        return pc
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.configuration?.titlePadding = CGFloat(15)
        var config = UIButton.Configuration.filled()
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 50, bottom: 10, trailing: 50)
        button.configuration = config
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()

    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [pageControl, nextButton])
        sv.axis = .vertical
        sv.alignment = .center
        sv.spacing = 10
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        addSubview(pageViewController.view)
        addSubview(stackView)
    }
    
    private func setupConstraints() {
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageViewController.view.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                pageViewController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
                pageViewController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
                
                stackView.topAnchor.constraint(equalTo: pageViewController.view.bottomAnchor, constant: 20),
                stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
                stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
            ])
    }
    
    func setViewController(_ viewController: UIViewController) {
        pageViewController.setViewControllers([viewController], direction: .forward, animated: true, completion: nil)
    }
    
    func setCurrentPage(_ index: Int) {
        pageControl.currentPage = index
    }
    
    func updateNextButtonTitle(isLastPage: Bool) {
        let title = isLastPage ? NSLocalizedString("Onboarding_Finish_Button", comment: "finish") : NSLocalizedString("Onboarding_Next_Button", comment: "next")
        nextButton.setTitle(title, for: .normal)
    }
    
    @objc private func nextButtonTapped() {
        delegate?.nextTapped()
    }
    
    @objc private func pageControlValueChanged(_ sender: UIPageControl) {
        delegate?.pageControlTapped(at: sender.currentPage)
    }
}
