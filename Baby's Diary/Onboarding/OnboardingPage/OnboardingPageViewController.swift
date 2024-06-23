//
//  OnboardingViewController.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 23/06/2024.
//

import UIKit

class OnboardingPageViewController: UIViewController {

    private let onboardingView = OnboardingPageView()
    private let viewModel : OnboardingPageViewModel
    
    init(viewModel: OnboardingPageViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        super.loadView()
        self.view = onboardingView

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //bind viewmodel to view here
        bindView()
    }
    
    func bindView(){
        onboardingView.bind(to: viewModel)
        self.view = onboardingView
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
