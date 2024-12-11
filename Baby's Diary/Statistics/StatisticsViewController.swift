//
//  StatisticsViewController.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 03/07/2024.
//

import UIKit

class StatisticsViewController: UIViewController {

    private var statisticsView : StatisticsView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    init(){
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        statisticsView = StatisticsView()
        self.view = statisticsView
    }
}

