//
//  ViewModel.swift
//  SwiftExample
//
//  Created by Jacky Lam on 31/3/2021.
//

import RxSwift

open class ViewModel<Interactor: InteractorProtocol, Coordinator: CoordinatorProtocol>: ViewModelProtocol {
    public let interactor: Interactor
    public let coordinator: Coordinator
    public let disposeBag = DisposeBag()

    public required init(interactor: Interactor, coordinator: Coordinator) {
        self.interactor = interactor
        self.coordinator = coordinator
        initializeSubscription()
    }

    open func initializeSubscription() {
        initializeInvalidatePageSubscription()
        initializeAlertSubscription()
    }

    // fetch page

    public var fetchPagePublishSubject = PublishSubject<Void>()

    public func initializeInvalidatePageSubscription() {
        interactor.fetchPagePublishSubject.subscribe { _ in
            self.fetchPagePublishSubject.onNext(())
        }.disposed(by: DisposeBag())
    }

    // alert

    public var alertPublishSubject = PublishSubject<FormError>()

    public func initializeAlertSubscription() {
        interactor.alertPublishSubject.subscribe { error in
            self.alertPublishSubject.onNext(error)
        }.disposed(by: disposeBag)
    }
}
