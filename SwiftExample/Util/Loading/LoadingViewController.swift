//
//  LoadingViewController.swift
//  SwiftExample
//
//  Created by Jacky Lam on 13/5/2021.
//

import UIKit

class LoadingViewController: UIViewController {

    private var loadingActivityIndicator: UIActivityIndicatorView!

    private var cancelButton: UIButton!

    weak var delegate: LoadingViewControllerDelegate?

    init(cancelEnabled: Bool) {
        self.isCancelEnabled = cancelEnabled
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .overFullScreen
        self.modalTransitionStyle = .crossDissolve
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()

        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)

        loadingActivityIndicator = UIActivityIndicatorView()
        loadingActivityIndicator.translatesAutoresizingMaskIntoConstraints = false

        if #available(iOS 13.0, *) {
            loadingActivityIndicator.style = .large
        } else {
            loadingActivityIndicator.style = .whiteLarge
        }

        loadingActivityIndicator.color = .white

        cancelButton = UIButton(frame: .zero)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.titleLabel?.textColor = .white
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.addTarget(self, action: #selector(handleCancel), for: .touchUpInside)
        cancelButton.isHidden = !isCancelEnabled

        view.addSubview(loadingActivityIndicator)
        view.addSubview(cancelButton)

        NSLayoutConstraint.activate([
            loadingActivityIndicator.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loadingActivityIndicator.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loadingActivityIndicator.topAnchor.constraint(equalTo: view.topAnchor),
            loadingActivityIndicator.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            cancelButton.topAnchor.constraint(equalTo: loadingActivityIndicator.centerYAnchor, constant: 100),
            cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        loadingActivityIndicator.startAnimating()
    }

    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        loadingActivityIndicator.stopAnimating()
        super.dismiss(animated: true, completion: completion)
    }

    // MARK: Cancellation

    private var isCancelEnabled: Bool

    @objc private func handleCancel() {
        dismiss(animated: true) {
            self.delegate?.loadingViewControllerDidCancelLoading(self)
        }
    }

}

// MARK: - LoadingViewControllerDelegate

protocol LoadingViewControllerDelegate: NSObjectProtocol {

    func loadingViewControllerDidCancelLoading(_ viewController: LoadingViewController)

}
