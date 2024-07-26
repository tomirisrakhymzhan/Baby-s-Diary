//
//  RegistrationViewModel.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 25/07/2024.
//

import Foundation
import Combine
import FirebaseAuth

class RegistrationViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password1: String = ""
    @Published var password2: String = ""
    @Published var emailError: String?
    @Published var passwordError: String?
    @Published var generalError: String?
    @Published var isLoading: Bool = false
    @Published var isSignUpSuccessful: Bool = false

    private var cancellables = Set<AnyCancellable>()

    func signUp() {
        // Validate email and password before sign-up
        let emailValidationError = validateEmail(email)
        let passwordValidationError = validatePasswords(password1, password2)

        if let emailError = emailValidationError {
            self.emailError = emailError
        } else {
            self.emailError = nil
        }

        if let passwordError = passwordValidationError {
            self.passwordError = passwordError
        } else {
            self.passwordError = nil
        }

        self.emailError = nil
        self.passwordError = nil
        
        // Proceed if there are no validation errors
        if emailError == nil, passwordError == nil {
            isLoading = true
            Auth.auth().createUser(withEmail: email, password: password1) { authResult, error in
                DispatchQueue.main.async {
                    self.isLoading = false
                    if let error = error {
                        self.generalError = error.localizedDescription
                    } else {
                        self.isSignUpSuccessful = true
                    }
                }
            }
        } else {
            generalError = String(localized: "Please_Correct_Errors")
        }
    }


    private func validateEmail(_ email: String) -> String? {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email) ? nil : String(localized: "Invalid_email_format")
    }
    
    private func validatePasswords(_ password1: String, _ password2: String) -> String?{
        var outputMessage: String? = ""

        switch true {
        case password1.isEmpty || password2.isEmpty:
            outputMessage = String(localized: "Password_Cannot_Empty")
        case password1 != password2:
            outputMessage = String(localized: "Passwords_Do_Not_Match")
        case password1.count < 6:
            outputMessage = String(localized: "Password_length_insufficient")
        default:
            break
        }

        return outputMessage

    }
}
