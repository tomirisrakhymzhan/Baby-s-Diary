//
//  OnboardingViewController.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 23/06/2024.
//

import UIKit

class OnboardingPageViewController: UIViewController {

    private var onboardingView : OnboardingPageView!
    private let viewModel: OnboardingPageViewModel
    
    init(viewModel: OnboardingPageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        onboardingView = OnboardingPageView()
        self.view = onboardingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingView.configure(with: viewModel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
