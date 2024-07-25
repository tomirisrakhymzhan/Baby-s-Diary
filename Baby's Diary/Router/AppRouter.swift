//
//  AppRouter.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 04/07/2024.
//

import UIKit

protocol RouterProtocol: AnyObject {
    func start()
    func showConfirmationAlert(title: String, message: String, completion: @escaping (()->(Void)) )
    func showMainScreen()
    func showSignIn()
    func showAddBabyForm()
}

class AppRouter: RouterProtocol {

    
    private let navigationController: UINavigationController
    
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
            showMainScreen()
        } else {
            showOnboarding()
        }
    }
    
    
    func showMainScreen() {
        let tabBarController = TabBarFactory.createTabBarViewController()
        navigationController.setViewControllers([tabBarController], animated: true)
    }
    
    private func showOnboarding() {
        let onboardingVC = OnboardingViewController()
        onboardingVC.router = self
        
        navigationController.setViewControllers([onboardingVC], animated: true)
    }
    
    func showConfirmationAlert(title: String, message: String, completion: @escaping (() -> ())) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let cancelAction = UIAlertAction(title: String(localized: "Cancel"), style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let yesAction = UIAlertAction(title: String(localized: "Yes"), style: .default) { _ in
            completion()
        }
        alertController.addAction(yesAction)
        
        navigationController.present(alertController, animated: true, completion: nil)
    }
    
    func showSignIn() {
        let signInVC = SignInViewController()
        signInVC.router = self
        navigationController.setViewControllers([signInVC], animated: true)
    }
    
    func showAddBabyForm() {
        let addBabyVC = AddBabyViewController()
        navigationController.setViewControllers([addBabyVC], animated: true)
    }
}
