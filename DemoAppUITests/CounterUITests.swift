import XCTest

final class CounterUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    private func login(_ app: XCUIApplication) {
        app.launch()
        app.textFields["usernameField"].tap()
        app.textFields["usernameField"].typeText("admin")
        app.secureTextFields["passwordField"].tap()
        app.secureTextFields["passwordField"].typeText("secret")
        app.buttons["loginButton"].tap()
        XCTAssertTrue(app.staticTexts["countLabel"].waitForExistence(timeout: 5))
    }

    func testIncrementDecrementReset() throws {
        let app = XCUIApplication()
        login(app)

        let count = app.staticTexts["countLabel"]
        XCTAssertEqual(count.label, "0")

        app.buttons["incrementButton"].tap()
        app.buttons["incrementButton"].tap()
        XCTAssertEqual(count.label, "2")

        app.buttons["decrementButton"].tap()
        XCTAssertEqual(count.label, "1")

        app.buttons["resetButton"].tap()
        XCTAssertEqual(count.label, "0")
    }
}
