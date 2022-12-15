//
//  TestController.swift
//  SwiftExample
//
//  Created by Jacky Lam on 4/12/2022.
//

import UIKit

class TestController: NavigationController {
    init() {
        let interactor = TestInteractor()
        let coordinator = TestCoordinator(navigationController: nil)
        let viewModel = TestViewModel(interactor: interactor, coordinator: coordinator)
        let viewController = TestViewController(viewModel: viewModel)
        super.init(rootViewController: viewController)
        coordinator.navigationController = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
