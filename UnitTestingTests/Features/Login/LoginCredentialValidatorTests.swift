//
//  LoginCredentialValidatorTests.swift
//  UnitTestingTests
//
//  Created by Jonathan Samudio on 1/23/19.
//  Copyright © 2019 Jonathan Samudio. All rights reserved.
//

import XCTest
@testable import UnitTesting

class LoginCredentialValidatorTests: XCTestCase {

    var sut: LoginCredentialValidator!
    
    override func setUp() {
        sut = LoginCredentialValidator()
    }

    func testIsValidEmail_Valid() {
        // Given
        let email = "ruchiiscool@prolificinteractive.com"
        
        // When
        let result = sut.isValid(email: email)
        
        // Then
        XCTAssertTrue(result)
    }
    
    func testIsValidEmail_InValid_AtSymbol() {
        // Given
        let email = "jhantelleiscoolprolificinteractive.com"
        
        // When
        let result = sut.isValid(email: email)
        
        // Then
        XCTAssertFalse(result)
    }
    
    func testIsValidEmail_InValid_Length() {
        // Given
        let email = "jon@"
        
        // When
        let result = sut.isValid(email: email)
        
        // Then
        XCTAssertFalse(result)
    }
    
    func testIsValidEmail_InValid_Space() {
        // Given
        let email = "jon@prolific interactive"
        
        // When
        let result = sut.isValid(email: email)
        
        // Then
        XCTAssertFalse(result)
    }
}
