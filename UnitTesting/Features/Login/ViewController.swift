//
//  ViewController.swift
//  UnitTesting
//
//  Created by Jonathan Samudio on 12/4/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

import UIKit

protocol NetworkProvider {

    func loginUser(email: String, password: String)
}

class ViewController: UIViewController {

    lazy var viewModel: ViewModel = {
        let viewModel = ViewModel(networkProvider: AlamofireNetworkProvider())
        viewModel.delegate = self
        return viewModel
    }()

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!

    @IBAction func didTapLogin(_ sender: Any) {
        viewModel.loginUser()
    }
}

extension ViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {

        if textField == emailTextField {
            viewModel.email = (textField.text ?? "") + string
        } else if textField == passwordTextField {
            viewModel.password = (textField.text ?? "") + string
        }
        return true
    }
}

extension ViewController: ViewDelegate {

    func display(error: String) {
        errorLabel.text = error
        errorLabel.isHidden = false
    }

    func hideError() {
        errorLabel.isHidden = true
    }
}
