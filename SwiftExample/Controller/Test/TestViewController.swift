//
//  TestViewController.swift
//  SwiftExample
//
//  Created by Jacky Lam on 28/6/2022.
//

import UIKit

class TestViewController: ViewController<TestViewModel> {
    private var contentView: UIView!
    private var formButton: UIButton!

    override func initializeView() {
        super.initializeView()

        view.backgroundColor = .white

        contentView = UIView(frame: .zero)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentView)

        formButton = Button(style: .default)
        formButton.accessibilityIdentifier = "form"
        formButton.setTitle("Form", for: .normal)
        formButton.addTarget(self, action: #selector(handleForm), for: .touchUpInside)
        formButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(formButton)

        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Dimen.spacing(.normal)),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Dimen.spacing(.normal)),
            contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            formButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            formButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            formButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            formButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    @objc private func handleForm() {
        viewModel.coordinator.pushViewController(TestFormViewController.self, animated: true)
    }
}
