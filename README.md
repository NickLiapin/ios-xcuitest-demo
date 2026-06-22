# iOS UI Test Automation (XCUITest)

[![iOS UI Tests](https://github.com/NickLiapin/ios-xcuitest-demo/actions/workflows/ci.yml/badge.svg)](https://github.com/NickLiapin/ios-xcuitest-demo/actions/workflows/ci.yml)
[![Swift](https://img.shields.io/badge/Swift-5-F05138?logo=swift&logoColor=white)](https://swift.org)
[![XCUITest](https://img.shields.io/badge/XCUITest-iOS-000000?logo=apple&logoColor=white)](https://developer.apple.com/documentation/xctest)

UI test automation for a small **SwiftUI** iOS app using **XCUITest**, running on the
iOS Simulator in **GitHub Actions** CI. It covers a login flow (valid and invalid
credentials) and an interactive counter screen.

The app is intentionally compact - the point is to show **how I structure iOS UI
automation**: stable accessibility identifiers, explicit waits (`waitForExistence`),
and a CI pipeline that builds and tests on a simulator with no manual setup.

## What this demonstrates

- **XCUITest fundamentals** - launching the app, locating elements by accessibility
  identifier, typing into text/secure fields, tapping, and asserting state.
- **Stable locators** - every control exposes an `accessibilityIdentifier`, so tests
  don't depend on visible text or layout.
- **Explicit waits** - `waitForExistence(timeout:)` instead of brittle sleeps.
- **Project as code** - the Xcode project is generated from [`project.yml`](project.yml)
  with [XcodeGen](https://github.com/yonsm/XcodeGen), so it's reviewable and CI regenerates it.
- **Simulator CI** - GitHub Actions picks an available iPhone simulator dynamically
  (robust across runner Xcode versions) and runs the suite headless.

## App under test

- **Login** (`LoginView`) - `admin` / `secret` logs in; anything else shows an error.
- **Counter** (`CounterView`) - increment / decrement / reset, shown after login.

## Tests

- `LoginUITests` - successful login reaches the counter; invalid login shows an error.
- `CounterUITests` - increment, decrement and reset update the displayed value.

## Running locally

Requires Xcode and [XcodeGen](https://github.com/yonsm/XcodeGen) (`brew install xcodegen`).

```bash
xcodegen generate
xcodebuild test \
  -project DemoApp.xcodeproj \
  -scheme DemoApp \
  -destination 'platform=iOS Simulator,name=iPhone 16' \
  CODE_SIGNING_ALLOWED=NO
```

(Open `DemoApp.xcodeproj` in Xcode and press Cmd-U to run the tests interactively.)

## Tech

Swift, SwiftUI, XCUITest, XcodeGen, GitHub Actions (macOS)

---

Built by **Nick Liapin** - Senior SDET / QA Automation Engineer. A focused portfolio
demo of iOS UI test automation; the same patterns scale to real apps and larger suites.
