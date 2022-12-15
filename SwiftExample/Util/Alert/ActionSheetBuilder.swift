//
//  ActionSheetBuilder.swift
//  SwiftExample
//
//  Created by Jacky Lam on 4/6/2021.
//

import UIKit

class ActionSheetBuilder {

    private var title: String?

    private var actions = [UIAlertAction]()

    func title(_ title: String?) -> ActionSheetBuilder {
        self.title = title
        return self
    }

    func addAction(title: String?, style: UIAlertAction.Style, handler: (() -> Void)? = nil) -> ActionSheetBuilder {
        actions.append(UIAlertAction(title: title, style: style, handler: { _ in handler?() }))
        return self
    }

    func build() -> UIViewController {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)

        actions.forEach { (action) in
            alertController.addAction(action)
        }

        return alertController
    }

}
