//
//  RegistrationConfirmationViewModel.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 31/07/2024.
//

import Combine
import FirebaseAuth

class RegistrationConfirmationViewModel {
    let emailAddress = CurrentValueSubject<String?, Never>(nil)
    
    init() {
        emailAddress.value = Auth.auth().currentUser?.email
    }
    
    func sendConfirmationEmail(completion: @escaping (Bool) -> Void) {
        Auth.auth().currentUser?.sendEmailVerification(completion: { error in
            if let error = error {
                print("Error sending email verification: \(error)")
                completion(false)
            } else {
                completion(true)
            }
        })
    }
    
    func checkEmailVerified(completion: @escaping (Bool) -> Void) {
        Auth.auth().currentUser?.reload(completion: { error in
            if let error = error {
                print("Error reloading user: \(error)")
                completion(false)
                return
            }
            if let user = Auth.auth().currentUser {
                completion(user.isEmailVerified)
            } else {
                completion(false)
            }
        })
    }
}

