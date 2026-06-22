import XCTest

final class LoginUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testSuccessfulLoginShowsCounter() throws {
        let app = XCUIApplication()
        app.launch()

        app.textFields["usernameField"].tap()
        app.textFields["usernameField"].typeText("admin")
        app.secureTextFields["passwordField"].tap()
        app.secureTextFields["passwordField"].typeText("secret")
        app.buttons["loginButton"].tap()

        XCTAssertTrue(
            app.staticTexts["welcomeLabel"].waitForExistence(timeout: 5),
            "Welcome screen should appear after a valid login"
        )
    }

    func testInvalidLoginShowsError() throws {
        let app = XCUIApplication()
        app.launch()

        app.textFields["usernameField"].tap()
        app.textFields["usernameField"].typeText("admin")
        app.secureTextFields["passwordField"].tap()
        app.secureTextFields["passwordField"].typeText("wrong")
        app.buttons["loginButton"].tap()

        XCTAssertTrue(
            app.staticTexts["errorLabel"].waitForExistence(timeout: 5),
            "An error message should appear for invalid credentials"
        )
    }
}
