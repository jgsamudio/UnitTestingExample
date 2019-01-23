//
//  LoginCredentialValidator.swift
//  UnitTesting
//
//  Created by Jonathan Samudio on 1/23/19.
//  Copyright © 2019 Jonathan Samudio. All rights reserved.
//

import Foundation

struct LoginCredentialValidator: CredentialValidator {
    
    func isValid(email: String) -> Bool {
        return email.contains("@") &&
            email.count > 5 &&
            !email.contains(" ")
    }
    
    func isValid(password: String) -> Bool {
        return password.count > 3
    }
}
