//
//  RegistrationConfirmationViewController.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 25/07/2024.
//

import UIKit

class RegistrationConfirmationViewController: UIViewController {

    weak var router : RouterProtocol?
    let registrationConfirmationView = RegistrationConfirmationView()
    
    override func loadView() {
        view = registrationConfirmationView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
