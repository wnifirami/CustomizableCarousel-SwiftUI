import XCTest
@testable import CustomizableCarousel

@MainActor
final class CarouselConfigurationTests: XCTestCase {

    // MARK: - Default values

    func testDefaultAppearanceShowsIndicator() {
        XCTAssertTrue(CarouselConfiguration.default.appearance.showsIndicator)
    }

    func testDefaultAppearanceShowsNavigationButtons() {
        XCTAssertTrue(CarouselConfiguration.default.appearance.showsNavigationButtons)
    }

    func testDefaultAppearanceInactiveScale() {
        XCTAssertEqual(CarouselConfiguration.default.appearance.inactiveScale, 0.88)
    }

    func testDefaultLayoutCardHeight() {
        XCTAssertEqual(CarouselConfiguration.default.layout.cardHeight, 180)
    }

    func testDefaultLayoutCardWidthRatio() {
        XCTAssertEqual(CarouselConfiguration.default.layout.cardWidthRatio, 0.78)
    }

    func testDefaultBehaviorDoesNotLoopInfinitely() {
        XCTAssertFalse(CarouselConfiguration.default.behavior.loopsInfinitely)
    }

    func testDefaultBehaviorHasNoAutoPlay() {
        XCTAssertNil(CarouselConfiguration.default.behavior.autoPlayInterval)
    }

    func testDefaultAnimationSpringResponse() {
        XCTAssertEqual(CarouselConfiguration.default.animation.springResponse, 0.38)
    }

    // MARK: - Value semantics

    func testMutatingAppearanceCopyDoesNotAffectOriginal() {
        let original = CarouselConfiguration.default
        var copy = original
        copy.appearance.showsIndicator = false
        XCTAssertTrue(original.appearance.showsIndicator)
        XCTAssertFalse(copy.appearance.showsIndicator)
    }

    func testMutatingLayoutCopyDoesNotAffectOriginal() {
        let original = CarouselConfiguration.default
        var copy = original
        copy.layout.cardHeight = 999
        XCTAssertEqual(original.layout.cardHeight, 180)
    }

    func testMutatingBehaviorCopyDoesNotAffectOriginal() {
        let original = CarouselConfiguration.default
        var copy = original
        copy.behavior.loopsInfinitely = true
        XCTAssertFalse(original.behavior.loopsInfinitely)
    }

    func testMutatingAnimationCopyDoesNotAffectOriginal() {
        let original = CarouselConfiguration.default
        var copy = original
        copy.animation.springResponse = 0.9
        XCTAssertEqual(original.animation.springResponse, 0.38)
    }

    // MARK: - Equatable

    func testDefaultConfigurationsAreEqual() {
        XCTAssertEqual(CarouselConfiguration.default, CarouselConfiguration.default)
    }

    func testConfigurationsWithDifferentAppearanceAreNotEqual() {
        let first = CarouselConfiguration.default
        var second = CarouselConfiguration.default
        second.appearance.showsIndicator = false
        XCTAssertNotEqual(first, second)
    }

    func testConfigurationsWithDifferentLayoutAreNotEqual() {
        let first = CarouselConfiguration.default
        var second = CarouselConfiguration.default
        second.layout.cardHeight = 300
        XCTAssertNotEqual(first, second)
    }

    func testConfigurationsWithDifferentBehaviorAreNotEqual() {
        let first = CarouselConfiguration.default
        var second = CarouselConfiguration.default
        second.behavior.loopsInfinitely = true
        XCTAssertNotEqual(first, second)
    }
}
