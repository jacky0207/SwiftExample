//
//  FormValidator.swift
//  SwiftExample
//
//  Created by Jacky Lam on 14/12/2022.
//

protocol Validator {
    associatedtype Form
    static func invalidate(for form: Form) -> FormResult
}

open class FormValidator<Form>: Validator {
    class func invalidate(for form: Form) -> FormResult {
        return .success
    }
}

enum FormResult {
    case success
    case fail(FormError)
}

extension FormResult {
    var isValid: Bool {
        switch self {
        case .success:
            return true
        case .fail:
            return false
        }
    }
}

public struct FormError {
    var title: String?
    var message: String?
}
