//
//  TabBarViewController.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 03/07/2024.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let sleepViewController = SleepViewController()
        sleepViewController.title = String(localized: "Onboarding_Sleep_Title")
        sleepViewController.tabBarItem.image = UIImage(systemName: "powersleep")

        let statisticsViewController = StatisticsViewController()
        statisticsViewController.title = String(localized: "Onboarding_Statistics_Title")
        statisticsViewController.tabBarItem.image = UIImage(systemName: "chart.bar.fill")

        self.viewControllers = [sleepViewController, statisticsViewController]
        self.delegate = self

    }

    
    // MARK: - UITabBarControllerDelegate
        
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected tab \(viewController.tabBarItem.title ?? "")")
    }
}
