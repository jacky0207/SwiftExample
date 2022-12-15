//
//  TestFormViewModel.swift
//  SwiftExample
//
//  Created by Jacky Lam on 14/12/2022.
//

class TestFormViewModel: ViewModel<TestFormInteractor, TestFormCoordinator>, TestFormViewModelProtocol {
    func submitForm(_ form: TestForm) {
        interactor.submitForm(form)
    }
}
