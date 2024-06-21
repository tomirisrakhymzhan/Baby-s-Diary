//
//  OnboardingCoordinator.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 20/06/2024.
//

import Foundation
import UIKit

protocol OnboardingCoordinatorProtocol: Coordinator {
    func showNextPage()
    func finishOnboarding()
}

class OnboardingCoordinator: OnboardingCoordinatorProtocol {
    var navigationController: UINavigationController
    private let pages: [OnboardingModel] = [
        OnboardingModel(title: "Hey there", description: "Lorem ispum lorem ipsum olerm ispum", imageName: "baby-icon"),
        OnboardingModel(title: "Features", description: "Lorem ispum lorem ipsum olerm ispum", imageName: "baby-icon"),
        OnboardingModel(title: "Let's start!", description: "Lorem ispum lorem ipsum olerm ispum?", imageName: "baby-icon")
    ]
    private var currentIndex = 0

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showPage(at: currentIndex)
    }

    private func showPage(at index: Int) {
        guard index < pages.count else {
            finishOnboarding()
            return
        }

        //let pageViewModel = OnboardingViewModel(page: pages[index])
        let pageViewController = OnboardingViewController()
        //pageViewController.viewModel = pageViewModel
        
        navigationController.pushViewController(pageViewController, animated: true)
    }

    @objc private func skipTapped() {
        finishOnboarding()
    }

    func showNextPage() {
        currentIndex += 1
        showPage(at: currentIndex)
    }

    func finishOnboarding() {
        // тут переход к основному интерфейсу приложения
        print("Onboarding Finished")
        let appCoordinator = AppCoordinator(navigationController: self.navigationController)
        appCoordinator.showMainApp()
       
    }
}
