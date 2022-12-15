//
//  TestFormUITests.swift
//  SwiftExampleUITests
//
//  Created by Jacky Lam on 15/12/2022.
//

import XCTest

class TestFormUITests: XCTestCase {
    var app = XCUIApplication()

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testFormSubmit_withValidForm_shouldAlert() throws {
        app.buttons["form"].tap()

        let usernameTextField = app.textFields["username"]
        usernameTextField.tap()
        usernameTextField.typeText("username")

        let passwordTextField = app.textFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")

        app.buttons["submit"].tap()

        XCTAssert(app.alerts.firstMatch.waitForExistence(timeout: 5))
    }

    func testFormSubmit_withEmptyForm_shouldAlert() throws {
        app.buttons["form"].tap()
        app.buttons["submit"].tap()
        XCTAssert(app.alerts.firstMatch.waitForExistence(timeout: 5))
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
