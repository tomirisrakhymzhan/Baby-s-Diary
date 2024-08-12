//
//  RegistrationConfirmationViewModel.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 31/07/2024.
//

//import Combine
//import FirebaseAuth
//
//class RegistrationConfirmationViewModel {
//    @Published var emailAddress : String?
//    
//    init() {
//        emailAddress = Auth.auth().currentUser?.email
//    }
//    
//    func sendConfirmationEmail(completion: @escaping (Result<String, Error>) -> Void) {
//        guard let user = Auth.auth().currentUser else {
//            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: String(localized: "User_Not_Found")])))
//            return
//        }
//
//        user.sendEmailVerification { error in
//            if let error = error {
//                completion(.failure(error))
//            } else {
//                completion(.success(String(localized: "Confirmation_Email_Sent")))
//            }
//        }
//    }
//    
//    func checkEmailVerified(completion: @escaping (Bool) -> Void) {
//        Auth.auth().currentUser?.reload(completion: { error in
//            if let error = error {
//                print("Error reloading user: \(error)")
//                completion(false)
//                return
//            }
//            if let user = Auth.auth().currentUser {
//                completion(user.isEmailVerified)
//            } else {
//                completion(false)
//            }
//        })
//    }
//}
//
import Combine
import FirebaseAuth
import SwiftMessages
import UIKit

class RegistrationConfirmationViewModel {
    @Published var emailAddress: String?
    
    init() {
        emailAddress = Auth.auth().currentUser?.email
    }
    
    func sendConfirmationEmail() -> Future<String, Error> {
        return Future { promise in
            guard let user = Auth.auth().currentUser else {
                promise(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: String(localized: "User_Not_Found")])))
                return
            }
            
            user.sendEmailVerification { error in
                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(String(localized: "Confirmation_Email_Sent")))
                }
            }
        }
    }
    
    func checkEmailVerified() -> Future<Bool, Error> {
        return Future { promise in
            Auth.auth().currentUser?.reload { error in
                if let error = error {
                    print("Error reloading user: \(error)")
                    promise(.failure(error))
                    return
                }
                if let user = Auth.auth().currentUser {
                    promise(.success(user.isEmailVerified))
                } else {
                    promise(.success(false))
                }
            }
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
    }
}
