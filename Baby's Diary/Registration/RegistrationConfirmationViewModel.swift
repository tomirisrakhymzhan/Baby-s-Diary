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
    
    func sendConfirmationEmail(completion: @escaping (Result<String, Error>) -> Void) {
        guard let user = Auth.auth().currentUser else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: String(localized: "User_Not_Found")])))
            return
        }

        user.sendEmailVerification { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(String(localized: "Confirmation_Email_Sent")))
            }
        }
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

