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

    func loginUser() {
        if isValidEmail() && isValidPassword() {
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

private extension ViewModel {

    func isValidEmail() -> Bool {
        return email.contains("@") &&
            email.count > 5
    }

    func isValidPassword() -> Bool {
        return password.count > 3
    }

}
