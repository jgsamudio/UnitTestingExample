//
//  MockNetworkProvider.swift
//  UnitTestingTests
//
//  Created by Jonathan Samudio on 12/4/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

import Foundation
@testable import UnitTesting

class MockNetworkProvider: NetworkProvider {

    var loginUserWasCalled = false
    var email = ""
    var password = ""

    func loginUser(email: String, password: String) {
        loginUserWasCalled = true
        self.email = email
        self.password = password
    }

}
