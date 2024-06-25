//
//  OnboardingViewController.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 23/06/2024.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    private let onboardingView = OnboardingView()
    private let viewModel: OnboardingViewModel
    
    private var pageViewControllers: [OnboardingPageViewController] = []
    
    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = onboardingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        onboardingView.delegate = self
        setupNavigationBar()
        setupPageViewController()
        onboardingView.pageControl.numberOfPages = viewModel.pageViewModels.count
    }
    
    private func setupNavigationBar() {
        let skipButton = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(skipButtonTapped))
        skipButton.tintColor = .systemBlue
        navigationItem.rightBarButtonItem = skipButton
    }
    
    private func setupPageViewController() {
        guard !viewModel.pageViewModels.isEmpty else {
            return
        }
        
        for viewModel in viewModel.pageViewModels {
            let pageVC = OnboardingPageViewController(viewModel: viewModel)
            pageViewControllers.append(pageVC)
        }
        
        if let firstViewController = pageViewControllers.first {
            onboardingView.setViewController(firstViewController)
            onboardingView.setCurrentPage(0)
        }
        
        if viewModel.pageViewModels.count > 1 {
            onboardingView.pageViewController.dataSource = self
            onboardingView.pageViewController.delegate = self
        }
    }
    
    @objc private func skipButtonTapped() {
        print("Skip button tapped")
    }
}

extension OnboardingViewController: OnboardingViewDelegate {
    func nextTapped() {
        if let nextIndex = viewModel.goToNextPage() {
            let nextViewController = pageViewControllers[nextIndex]
            onboardingView.setViewController(nextViewController)
            onboardingView.setCurrentPage(nextIndex)
        } else {
            print("Reached the last page")
        }
    }
}

extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pageViewControllers.firstIndex(of: viewController as! OnboardingPageViewController),
              currentIndex > 0 else {
            return nil
        }
        return pageViewControllers[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pageViewControllers.firstIndex(of: viewController as! OnboardingPageViewController),
              currentIndex < pageViewControllers.count - 1 else {
            return nil
        }
        return pageViewControllers[currentIndex + 1]
    }
}

extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed,
              let visibleViewController = pageViewController.viewControllers?.first as? OnboardingPageViewController,
              let index = pageViewControllers.firstIndex(of: visibleViewController) else {
            return
        }
        viewModel.currentPageIndex = index
        onboardingView.setCurrentPage(index)
    }
}
