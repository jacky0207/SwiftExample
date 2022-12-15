//
//  Interactor.swift
//  SwiftExample
//
//  Created by Jacky Lam on 4/12/2022.
//

import RxSwift

open class Interactor: InteractorProtocol {
    required public init() {}

    // fetch page

    public let fetchPagePublishSubject = PublishSubject<Void>()

    public func fetchPage() {
        fetchPagePublishSubject.onNext(())
    }

    // alert

    public var alertPublishSubject = PublishSubject<FormError>()

    public func alert(for error: FormError) {
        alertPublishSubject.onNext(error)
    }
}
