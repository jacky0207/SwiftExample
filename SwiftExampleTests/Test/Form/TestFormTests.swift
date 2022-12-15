//
//  TestFormTests.swift
//  SwiftExampleTests
//
//  Created by Jacky Lam on 15/12/2022.
//

import XCTest
@testable import SwiftExample

class TestFormTests: XCTestCase {
    var form = TestForm()

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        form = TestForm()
        try super.tearDownWithError()
    }

    func testValidate_withEmptyForm_shouldFalse() throws {
        XCTAssertFalse(TestFormValidator.invalidate(for: form).isValid)
    }

    func testValidate_withValidForm_shouldTrue() throws {
        form.username = "username"
        form.password = "password"
        XCTAssertTrue(TestFormValidator.invalidate(for: form).isValid)
    }
}
