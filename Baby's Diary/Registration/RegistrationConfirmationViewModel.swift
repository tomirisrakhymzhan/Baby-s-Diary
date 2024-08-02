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
            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Пользователь не найден"])))
            return
        }

        user.sendEmailVerification { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success("Ссылка для подтверждения отправлена на вашу почту."))
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

