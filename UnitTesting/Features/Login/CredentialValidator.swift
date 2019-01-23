//
//  CredentialValidator.swift
//  UnitTesting
//
//  Created by Jonathan Samudio on 1/23/19.
//  Copyright © 2019 Jonathan Samudio. All rights reserved.
//

import Foundation

protocol CredentialValidator {
    func isValid(email: String) -> Bool
    func isValid(password: String) -> Bool
}
