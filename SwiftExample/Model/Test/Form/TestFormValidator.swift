//
//  TestFormValidator.swift
//  SwiftExample
//
//  Created by Jacky Lam on 14/12/2022.
//

class TestFormValidator: FormValidator<TestForm> {
    override class func invalidate(for form: TestForm) -> FormResult {
        if form.username.isEmpty {
            return .fail(FormError(title: nil, message: "Please enter username"))
        }

        if form.password.isEmpty {
            return .fail(FormError(title: nil, message: "Please enter password"))
        }

        return .success
    }
}
