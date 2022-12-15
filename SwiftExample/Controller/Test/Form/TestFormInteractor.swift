//
//  TestFormInteractor.swift
//  SwiftExample
//
//  Created by Jacky Lam on 14/12/2022.
//

class TestFormInteractor: Interactor, TestFormInteractorProtocol {
    func submitForm(_ form: TestForm) {
        switch TestFormValidator.invalidate(for: form) {
        case .success:
            alert(for: FormError(message: "Success"))
        case .fail(let error):
            alert(for: error)
        }
    }
}
