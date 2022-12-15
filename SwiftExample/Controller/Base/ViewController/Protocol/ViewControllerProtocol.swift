//
//  ViewControllerProtocol.swift
//  SwiftExample
//
//  Created by Jacky Lam on 4/12/2022.
//

import UIKit
import RxSwift

public protocol ViewControllerProtocol {
    associatedtype ViewModel: ViewModelProtocol
    var viewModel: ViewModel { get }
    init(viewModel: ViewModel)

    var disposeBag: DisposeBag { get }
    func initializeInvalidatePageSubscription()
    func invalidatePage()

    func initializeAlertSubscription()
    func alert(for error: FormError)
}

public protocol ViewModelProtocol {
    associatedtype Interactor: InteractorProtocol
    associatedtype Coordinator: CoordinatorProtocol
    var interactor: Interactor { get }
    var coordinator: Coordinator { get }
    init(interactor: Interactor, coordinator: Coordinator)

    var disposeBag: DisposeBag { get }
    var fetchPagePublishSubject: PublishSubject<Void> { get }
    func initializeInvalidatePageSubscription()

    var alertPublishSubject: PublishSubject<FormError> { get }
    func initializeAlertSubscription()
}

public protocol InteractorProtocol {
    init()

    var fetchPagePublishSubject: PublishSubject<Void> { get }
    func fetchPage()

    var alertPublishSubject: PublishSubject<FormError> { get }
    func alert(for error: FormError)
}

public protocol CoordinatorProtocol {
    var navigationController: UINavigationController? { get }
    init(navigationController: UINavigationController?)

    func viewController<ViewController>(_ type: ViewController.Type) -> ViewController where ViewController: UIViewController, ViewController : ViewControllerProtocol
    func pushViewController<ViewController>(_ type: ViewController.Type, animated: Bool) where ViewController: UIViewController, ViewController : ViewControllerProtocol
}
