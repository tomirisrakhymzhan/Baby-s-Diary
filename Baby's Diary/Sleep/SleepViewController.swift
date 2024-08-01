//
//  SleepViewController.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 03/07/2024.
//

import UIKit

class SleepViewController: UIViewController {

    private var sleepView : SleepView!
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
        sleepView = SleepView()
        self.view = sleepView
    }
}
