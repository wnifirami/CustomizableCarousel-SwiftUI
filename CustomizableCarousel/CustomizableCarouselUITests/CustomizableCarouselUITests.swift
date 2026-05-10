import XCTest

final class CustomizableCarouselUITests: XCTestCase {

    private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    // MARK: - Launch

    func testNavigationTitleIsVisible() {
        XCTAssertTrue(app.navigationBars["Carousel"].exists)
    }

    // MARK: - Sheet flow

    func testThemeButtonOpensConfigurationSheet() {
        app.buttons["Theme"].tap()
        XCTAssertTrue(app.navigationBars["Configuration"].waitForExistence(timeout: 2))
    }

    func testDoneButtonDismissesConfigurationSheet() {
        app.buttons["Theme"].tap()
        _ = app.navigationBars["Configuration"].waitForExistence(timeout: 2)
        app.buttons["Done"].tap()
        XCTAssertTrue(app.navigationBars["Carousel"].waitForExistence(timeout: 2))
    }

    // MARK: - Toggle state

    func testIndicatorToggleIsOnByDefault() {
        app.buttons["Theme"].tap()
        let toggle = app.switches["Indicator"]
        _ = toggle.waitForExistence(timeout: 2)
        XCTAssertEqual(toggle.value as? String, "1")
    }

    func testNavigationButtonsToggleIsOnByDefault() {
        app.buttons["Theme"].tap()
        let toggle = app.switches["Navigation Buttons"]
        _ = toggle.waitForExistence(timeout: 2)
        XCTAssertEqual(toggle.value as? String, "1")
    }

    func testTogglingIndicatorChangesItsState() {
        app.buttons["Theme"].tap()
        let toggle = app.switches["Indicator"]
        _ = toggle.waitForExistence(timeout: 2)
        toggle.tap()
        XCTAssertEqual(toggle.value as? String, "0")
    }

    // MARK: - Preset selection

    func testSelectingMinimalPresetShowsCheckmark() {
        app.buttons["Theme"].tap()
        _ = app.navigationBars["Configuration"].waitForExistence(timeout: 2)
        app.staticTexts["Minimal"].tap()
        XCTAssertTrue(app.images["checkmark"].exists)
    }
}
