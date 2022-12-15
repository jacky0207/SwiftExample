//
//  NavigationController.swift
//  SwiftExample
//
//  Created by Jacky Lam on 7/6/2021.
//

import UIKit

open class NavigationController: UINavigationController {

    open override func viewDidLoad() {
        super.viewDidLoad()

        // Pop view controller stack by gesture doesn't work if the navigation bar is hidden or using custom back button.
        interactivePopGestureRecognizer?.isEnabled = true  // use custom swipe gesture

        // dismiss keyboard
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false  // avoid breaking tableView(_:didSelectRowAt:)
        navigationBar.addGestureRecognizer(tapGesture)
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    open override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }

    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }

    // MARK: Keyboard

    @objc func hideKeyboard() {
        view.endEditing(true)  // hide top view controller keyboard
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

}
