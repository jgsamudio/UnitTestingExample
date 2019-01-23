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

    private var email: String = ""
    private var password: String = ""

    private var networkProvider = AlamofireNetworkProvider()
    private var credentialValidator: CredentialValidator
    
    init(credentialValidator: CredentialValidator) {
        self.credentialValidator = credentialValidator
    }

    func loginUser() {
        if credentialValidator.isValid(email: email) && credentialValidator.isValid(password: password) {
            networkProvider.loginUser(email: email, password: password)
            delegate?.hideError()
        } else {
            delegate?.display(error: "Email or Password is incorrect.")
        }
    }
    
    func set(email: String) {
        self.email = email
    }
    
    func set(password: String) {
        self.password = password
    }
}
