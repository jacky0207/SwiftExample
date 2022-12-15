//
//  AlertUtil.swift
//  SwiftExample
//
//  Created by Jacky Lam on 10/5/2021.
//

import UIKit

class AlertBuilder {

    private var title: String?

    private var message: String?

    private var actions = [UIAlertAction]()

    private var preferredAction: UIAlertAction?

    func title(_ title: String?) -> AlertBuilder {
        self.title = title
        return self
    }

    func message(_ message: String?) -> AlertBuilder {
        self.message = message
        return self
    }

    func addAction(title: String?, style: UIAlertAction.Style, handler: (() -> Void)? = nil) -> AlertBuilder {
        actions.append(UIAlertAction(title: title, style: style, handler: { _ in handler?() }))
        return self
    }

    func addPreferredAction(title: String?, style: UIAlertAction.Style, handler: (() -> Void)? = nil) -> AlertBuilder {
        let action = UIAlertAction(title: title, style: style, handler: { _ in handler?() })
        actions.append(action)

        if preferredAction == nil {
            preferredAction = action
        }

        return self
    }

    func build() -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        actions.forEach { (action) in
            alertController.addAction(action)
        }

        alertController.preferredAction = preferredAction

        return alertController
    }

}
