//
//  ForgotPasswordViewModel.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 02/08/2024.
//

import FirebaseAuth

class ForgotPasswordViewModel {
    func sendPasswordResetLink(email: String, completion: @escaping (Result<String, Error>) -> Void){
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                completion(.failure(error))
                return
            }
            completion(.success(String(localized: "Password_Reset_Link_Sent")))
        }
    }
}
