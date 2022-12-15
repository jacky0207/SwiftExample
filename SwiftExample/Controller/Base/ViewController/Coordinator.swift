//
//  Coordinator.swift
//  SwiftExample
//
//  Created by Jacky Lam on 4/12/2022.
//

import UIKit

open class Coordinator: CoordinatorProtocol {
    public var navigationController: UINavigationController?

    required public init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    public func viewController<ViewController>(_ type: ViewController.Type) -> ViewController where ViewController : UIViewController, ViewController : ViewControllerProtocol {
        let interactor = type.ViewModel.Interactor()
        let coordinator = type.ViewModel.Coordinator(navigationController: navigationController)
        let viewModel = type.ViewModel(interactor: interactor, coordinator: coordinator)
        let viewController = ViewController(viewModel: viewModel)
        return viewController
    }

    public func pushViewController<ViewController>(_ type: ViewController.Type, animated: Bool) where ViewController : UIViewController, ViewController : ViewControllerProtocol {
        navigationController?.pushViewController(viewController(type), animated: animated)
    }
}
