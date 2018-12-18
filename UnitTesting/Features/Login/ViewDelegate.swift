//
//  ViewDelegate.swift
//  UnitTesting
//
//  Created by Jonathan Samudio on 12/4/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

import Foundation

protocol ViewDelegate: class {

    func display(error: String)

    func hideError()
}
