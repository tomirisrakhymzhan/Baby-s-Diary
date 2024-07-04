//
//  AppRouter.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 04/07/2024.
//

import UIKit

protocol Router: AnyObject {
    var navigationController: UINavigationController { get set }
    func start()
    func showAlert()
    func finishOnboarding()
    func showMainTabBar()
}

import UIKit

class AppRouter: Router {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        // удалить все из юзердефолтс, это временный код
        let defaults = UserDefaults.standard
        if let bundleIdentifier = Bundle.main.bundleIdentifier {
            defaults.removePersistentDomain(forName: bundleIdentifier)
        }

        // проверка прохождения онбординга
        if UserDefaults.standard.bool(forKey: "isOnboardingSeen") {
            showMainTabBar()
        } else {
            showOnboarding()
        }
    }
    
    
    func showMainTabBar() {
        let tabBarController = TabBarViewController()
        
        let sleepVC = SleepViewController()
        sleepVC.title = String(localized: "Onboarding_Sleep_Title")
        sleepVC.tabBarItem.image = UIImage(systemName: "powersleep")
        
        let statisticsVC = StatisticsViewController()
        statisticsVC.title = String(localized: "Onboarding_Statistics_Title")
        statisticsVC.tabBarItem.image = UIImage(systemName: "chart.bar.fill")
        
        tabBarController.viewControllers = [sleepVC, statisticsVC]
        
        navigationController.setViewControllers([tabBarController], animated: true)
    }
    
    private func showOnboarding() {
        let onboardingVC = OnboardingViewController()
        onboardingVC.router = self
        
        navigationController.setViewControllers([onboardingVC], animated: true)
    }
    
    func finishOnboarding() {
        UserDefaults.standard.set(true, forKey: "isOnboardingSeen")
        showMainTabBar()
    }
    
    func showAlert() {
        let alertController = UIAlertController(
            title: String(localized:"Onboarding_Alert_Title"),
            message: String(localized: "Onboarding_Alert_Message"),
            preferredStyle: .alert
        )
        
        let cancelAction = UIAlertAction(title: String(localized: "Cancel"), style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let yesAction = UIAlertAction(title: String(localized: "Yes"), style: .default) { [weak self] _ in
            self?.finishOnboarding()
        }
        alertController.addAction(yesAction)
        
        navigationController.present(alertController, animated: true, completion: nil)
    }
}
