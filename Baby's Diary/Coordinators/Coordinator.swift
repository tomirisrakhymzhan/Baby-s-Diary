//
//  Coordinator.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 20/06/2024.
//

import Foundation
import UIKit
protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
