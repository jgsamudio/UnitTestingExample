//
//  ViewModelTests.swift
//  UnitTestingTests
//
//  Created by Jonathan Samudio on 12/4/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

import XCTest
@testable import UnitTesting

class ViewModelTests: XCTestCase {

    var sut: ViewModel!
    var networkProvider: MockNetworkProvider!
    var delegate: MockViewDelegate!

    override func setUp() {
        networkProvider = MockNetworkProvider()
        sut = ViewModel(networkProvider: networkProvider)

        delegate = MockViewDelegate()
        sut.delegate = delegate
    }

    func testLoginUser_ValidCredentials_AtSymbolAndCount() {
        // Given
        sut.email = "stanleiscool@stanleiscool.com"
        sut.password = "coolerthantherest"

        // When
        sut.loginUser()

        // Then
        XCTAssertTrue(networkProvider.loginUserWasCalled)
        XCTAssertEqual(networkProvider.email, sut.email)
        XCTAssertEqual(networkProvider.password, sut.password)

        XCTAssertTrue(delegate.hideErrorWasCalled)
        XCTAssertFalse(delegate.displayErrorWasCalled)
    }

    func testLoginUser_InvalidCredentials_Email_LowCount() {
        // Given
        sut.email = "@"
        sut.password = "coolerthantherest"

        // When
        sut.loginUser()

        // Then
        XCTAssertFalse(networkProvider.loginUserWasCalled)
        XCTAssertFalse(delegate.hideErrorWasCalled)

        XCTAssertTrue(delegate.displayErrorWasCalled)
        XCTAssertEqual(delegate.error, "Email or Password is incorrect.")
    }

    func testLoginUser_InvalidCredentials_Email_MissingAtSymbol() {
        // Given
        sut.email = "stanleiscool.com"
        sut.password = "coolerthantherest"

        // When
        sut.loginUser()

        // Then
        XCTAssertFalse(networkProvider.loginUserWasCalled)
        XCTAssertFalse(delegate.hideErrorWasCalled)

        XCTAssertTrue(delegate.displayErrorWasCalled)
        XCTAssertEqual(delegate.error, "Email or Password is incorrect.")
    }

    func testLoginUser_InvalidCredentials_Password_LowCount() {
        // Given
        sut.email = "stanleiscool@stanleiscool.com"
        sut.password = "hi"

        // When
        sut.loginUser()

        // Then
        XCTAssertFalse(networkProvider.loginUserWasCalled)
        XCTAssertFalse(delegate.hideErrorWasCalled)

        XCTAssertTrue(delegate.displayErrorWasCalled)
        XCTAssertEqual(delegate.error, "Email or Password is incorrect.")    }
}
