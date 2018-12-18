//
//  ViewModel.swift
//  UnitTesting
//
//  Created by Jonathan Samudio on 12/4/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

import Foundation

class ViewModel {

    weak var delegate: ViewDelegate?

    var email: String = ""
    var password: String = ""

    private var networkProvider: NetworkProvider
    private var credentialValidator: CredentialValidator

    init(networkProvider: NetworkProvider,
         credentialValidator: CredentialValidator = CredentialValidator()) {
        self.networkProvider = networkProvider
        self.credentialValidator = credentialValidator
    }

    func loginUser() {
        if credentialValidator.isValid(email: email) &&
            credentialValidator.isValid(password: password) {
            networkProvider.loginUser(email: email, password: password)
            delegate?.hideError()
        } else {
            delegate?.display(error: "Email or Password is incorrect.")
        }
    }
}

//private extension ViewModel {
//
//    func isValidEmail() -> Bool {
//        return email.contains("@") &&
//            email.count > 5
//    }
//
//    func isValidPassword() -> Bool {
//        return password.count > 3
//    }
//
//}

class CredentialValidator {

    func isValid(email: String) -> Bool {
        return email.contains("@") &&
            email.count > 5
    }

    func isValid(password: String) -> Bool {
        return password.count > 3
    }

}
