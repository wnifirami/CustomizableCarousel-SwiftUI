import XCTest
@testable import CustomizableCarousel

@MainActor
final class CarouselMathTests: XCTestCase {

    func testNextIndexAtLastWithoutLoop() {
        XCTAssertEqual(CarouselMath.nextIndex(from: 2, count: 3, loopsInfinitely: false), 2)
    }

    func testNextIndexInMiddle() {
        XCTAssertEqual(CarouselMath.nextIndex(from: 1, count: 3, loopsInfinitely: false), 2)
    }

    func testNextIndexAtFirst() {
        XCTAssertEqual(CarouselMath.nextIndex(from: 0, count: 3, loopsInfinitely: false), 1)
    }

    func testNextIndexLoopsFromLast() {
        XCTAssertEqual(CarouselMath.nextIndex(from: 2, count: 3, loopsInfinitely: true), 0)
    }

    func testNextIndexLoopsInMiddle() {
        XCTAssertEqual(CarouselMath.nextIndex(from: 1, count: 3, loopsInfinitely: true), 2)
    }

    func testPreviousIndexAtFirstWithoutLoop() {
        XCTAssertEqual(CarouselMath.previousIndex(from: 0, count: 3, loopsInfinitely: false), 0)
    }

    func testPreviousIndexInMiddle() {
        XCTAssertEqual(CarouselMath.previousIndex(from: 1, count: 3, loopsInfinitely: false), 0)
    }

    func testPreviousIndexLoopsFromFirst() {
        XCTAssertEqual(CarouselMath.previousIndex(from: 0, count: 3, loopsInfinitely: true), 2)
    }

    func testNextIndexWithZeroCount() {
        XCTAssertEqual(CarouselMath.nextIndex(from: 0, count: 0, loopsInfinitely: false), 0)
    }

    func testPreviousIndexWithZeroCount() {
        XCTAssertEqual(CarouselMath.previousIndex(from: 0, count: 0, loopsInfinitely: false), 0)
    }
}
