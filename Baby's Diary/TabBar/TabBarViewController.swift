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
        self.delegate = self

    }

    
    // MARK: - UITabBarControllerDelegate
        
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected tab \(viewController.tabBarItem.title ?? "")")
    }
}
