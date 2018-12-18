//
//  MockViewDelegate.swift
//  UnitTestingTests
//
//  Created by Jonathan Samudio on 12/4/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

import Foundation
@testable import UnitTesting

class MockViewDelegate: ViewDelegate {

    var displayErrorWasCalled = false
    var hideErrorWasCalled = false
    var error = ""

    func display(error: String) {
        displayErrorWasCalled = true
        self.error = error
    }

    func hideError() {
        hideErrorWasCalled = true
    }

}
