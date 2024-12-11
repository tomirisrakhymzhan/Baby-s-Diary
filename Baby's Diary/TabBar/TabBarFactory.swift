//
//  TabBarFactory.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 05/07/2024.
//

import Foundation
import UIKit

class TabBarFactory {
    static func createTabBarViewController() -> TabBarViewController{
        let tabBarController = TabBarViewController()

        let sleepVC = SleepViewController()
        sleepVC.title = String(localized: "Onboarding_Sleep_Title")
        sleepVC.tabBarItem.image = UIImage(systemName: "powersleep")
        
        let statisticsVC = StatisticsViewController()
        statisticsVC.title = String(localized: "Onboarding_Statistics_Title")
        statisticsVC.tabBarItem.image = UIImage(systemName: "chart.bar.fill")
        
        tabBarController.viewControllers = [sleepVC, statisticsVC]
        return tabBarController
    }
}
