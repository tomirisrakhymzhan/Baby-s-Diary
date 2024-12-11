//
//  SignInViewModel.swift
//  Baby's Diary
//
//  Created by Томирис Рахымжан on 19/07/2024.
//

import Combine
import Foundation
import FirebaseAuth

class SignInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var emailError: String?
    @Published var passwordError: String?
    @Published var generalError: String?
    @Published var isLoading: Bool = false
    @Published var isSignInSuccessful: Bool = false

    private var cancellables = Set<AnyCancellable>()

    func signIn() {
        // Validate email and password before sign-in
        let emailValidationError = validateEmail(email)
        let passwordValidationError = password.isEmpty ? String(localized: "Password_Cannot_Empty") : nil

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

        // Proceed if there are no validation errors
        if emailError == nil, passwordError == nil {
            isLoading = true
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                DispatchQueue.main.async {
                    self?.isLoading = false
                    if let error = error {
                        self?.generalError = error.localizedDescription
                    } else {
                        self?.isSignInSuccessful = true
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
}
