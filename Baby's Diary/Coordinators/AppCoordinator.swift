//
//  AppCoordinator.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 20/06/2024.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        // Проверка нужно ли показывать онбординг
        let isOnboardingCompleted = UserDefaults.standard.bool(forKey: "isOnboardingCompleted")
        if isOnboardingCompleted {
            showMainApp()
        } else {
            showOnboarding()
        }
    }

    private func showOnboarding() {
        let onboardingCoordinator = OnboardingCoordinator(navigationController: navigationController)
        onboardingCoordinator.start()
    }

    func showMainApp() {
        // Настройка основного интерфейса приложения
        let mainViewController = UIViewController()
        mainViewController.view.backgroundColor = .blue
        mainViewController.title = "Главный Экран"
        navigationController.pushViewController(mainViewController, animated: false)
    }
}
