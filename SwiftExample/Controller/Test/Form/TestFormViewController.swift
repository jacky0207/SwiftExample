//
//  TestFormViewController.swift
//  SwiftExample
//
//  Created by Jacky Lam on 14/12/2022.
//

import UIKit

class TestFormViewController: ViewController<TestFormViewModel> {
    private var contentView: UIView!
    private var usernameTextField: UITextField!
    private var passwordTextField: UITextField!
    private var submitButton: UIButton!

    override func initializeView() {
        super.initializeView()

        view.backgroundColor = .white

        contentView = UIView(frame: .zero)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentView)

        usernameTextField = TextField(style: .default)
        usernameTextField.accessibilityIdentifier = "username"
        usernameTextField.placeholder = "username"
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(usernameTextField)

        passwordTextField = TextField(style: .default)
        passwordTextField.accessibilityIdentifier = "password"
        passwordTextField.placeholder = "password"
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(passwordTextField)

        submitButton = Button(style: .default)
        submitButton.accessibilityIdentifier = "submit"
        submitButton.setTitle("Submit", for: .normal)
        submitButton.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(submitButton)

        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Dimen.spacing(.normal)),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Dimen.spacing(.normal)),
            contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            usernameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            usernameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            usernameTextField.topAnchor.constraint(equalTo: contentView.topAnchor),

            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor),

            submitButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            submitButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            submitButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor),
            submitButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    override func additionalInitializeView() {
        super.additionalInitializeView()
    }

    @objc private func handleSubmit() {
        viewModel.submitForm(TestForm.with({ form in
            form.username = usernameTextField.text ?? ""
            form.password = passwordTextField.text ?? ""
        }))
    }
}
