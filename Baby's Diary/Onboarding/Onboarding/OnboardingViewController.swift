//
//  OnboardingViewController.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 23/06/2024.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    private var onboardingView: OnboardingView!
    private let viewModel: OnboardingViewModel
    private var pageViewControllers: [UIViewController] = []
    
    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        onboardingView = OnboardingView()
        onboardingView.delegate = self
        self.view = onboardingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupNavigationBar()
        setupPageViewControllers()
        onboardingView.pageControl.numberOfPages = viewModel.numberOfPages
        updateNextButtonTitle()
    }
    
    private func setupNavigationBar() {
        let skipButton = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(skipButtonTapped))
        skipButton.tintColor = .systemBlue
        navigationItem.rightBarButtonItem = skipButton
    }
    
    private func setupPageViewControllers() {
        pageViewControllers = viewModel.pageViewModels.map { viewModel in
            let pageVC = OnboardingPageViewController(viewModel: viewModel)
            return pageVC
        }
        
        if let firstViewController = pageViewControllers.first {
            onboardingView.setViewController(firstViewController)
            onboardingView.setCurrentPage(0)
        }
        
        onboardingView.pageViewController.dataSource = self
        onboardingView.pageViewController.delegate = self
    }
    
    private func updateNextButtonTitle() {
        let isLastPage = viewModel.isLastPage
        onboardingView.updateNextButtonTitle(isLastPage: isLastPage)
    }
    
    @objc private func skipButtonTapped() {
        print("Skip button tapped")
    }
}

extension OnboardingViewController: OnboardingViewDelegate {
    func nextTapped() {
        if let nextIndex = viewModel.goToNextPage() {
            onboardingView.setViewController(pageViewControllers[nextIndex])
            onboardingView.setCurrentPage(nextIndex)
            updateNextButtonTitle()
        } else {
            print("Finish button tapped")
        }
    }
    
    func pageControlTapped(at index: Int) {
        let currentPage = viewModel.currentPageIndex
        let direction: UIPageViewController.NavigationDirection = index > currentPage ? .forward : .reverse
        
        viewModel.currentPageIndex = index
        
        let step = direction == .forward ? 1 : -1
        var nextIndex = currentPage + step
        
        while nextIndex != index {
            onboardingView.pageViewController.setViewControllers([pageViewControllers[nextIndex]], direction: direction, animated: true, completion: { _ in })
            nextIndex += step
        }
        
        onboardingView.pageViewController.setViewControllers([pageViewControllers[index]], direction: direction, animated: true, completion: { [weak self] _ in
            self?.onboardingView.setCurrentPage(index)
            self?.updateNextButtonTitle()
        })
    }
}

extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pageViewControllers.firstIndex(of: viewController), currentIndex > 0 else {
            return nil
        }
        return pageViewControllers[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pageViewControllers.firstIndex(of: viewController), currentIndex < pageViewControllers.count - 1 else {
            return nil
        }
        return pageViewControllers[currentIndex + 1]
    }
}

extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed, let visibleViewController = pageViewController.viewControllers?.first, let index = pageViewControllers.firstIndex(of: visibleViewController) else {
            return
        }
        viewModel.currentPageIndex = index
        onboardingView.setCurrentPage(index)
        updateNextButtonTitle()
    }
}
