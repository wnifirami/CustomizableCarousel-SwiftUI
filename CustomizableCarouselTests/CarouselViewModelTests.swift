import XCTest
@testable import CustomizableCarousel

@MainActor
final class CarouselViewModelTests: XCTestCase {

    func testInitialIndexIsZero() {
        let viewModel = CarouselViewModel()
        XCTAssertEqual(viewModel.currentIndex, 0)
    }

    func testAdvanceIncrementsIndex() {
        let viewModel = CarouselViewModel()
        viewModel.advance(count: 3, loopsInfinitely: false)
        XCTAssertEqual(viewModel.currentIndex, 1)
    }

    func testAdvanceStaysAtLastWithoutLoop() {
        let viewModel = CarouselViewModel()
        viewModel.currentIndex = 2
        viewModel.advance(count: 3, loopsInfinitely: false)
        XCTAssertEqual(viewModel.currentIndex, 2)
    }

    func testAdvanceLoopsFromLast() {
        let viewModel = CarouselViewModel()
        viewModel.currentIndex = 2
        viewModel.advance(count: 3, loopsInfinitely: true)
        XCTAssertEqual(viewModel.currentIndex, 0)
    }

    func testRetreatDecrementsIndex() {
        let viewModel = CarouselViewModel()
        viewModel.currentIndex = 2
        viewModel.retreat(count: 3, loopsInfinitely: false)
        XCTAssertEqual(viewModel.currentIndex, 1)
    }

    func testRetreatStaysAtFirstWithoutLoop() {
        let viewModel = CarouselViewModel()
        viewModel.retreat(count: 3, loopsInfinitely: false)
        XCTAssertEqual(viewModel.currentIndex, 0)
    }

    func testRetreatLoopsFromFirst() {
        let viewModel = CarouselViewModel()
        viewModel.retreat(count: 3, loopsInfinitely: true)
        XCTAssertEqual(viewModel.currentIndex, 2)
    }

    func testMultipleAdvancesAreSequential() {
        let viewModel = CarouselViewModel()
        viewModel.advance(count: 3, loopsInfinitely: false)
        viewModel.advance(count: 3, loopsInfinitely: false)
        XCTAssertEqual(viewModel.currentIndex, 2)
    }

    func testAdvanceThenRetreatReturnsToStart() {
        let viewModel = CarouselViewModel()
        viewModel.advance(count: 3, loopsInfinitely: false)
        viewModel.retreat(count: 3, loopsInfinitely: false)
        XCTAssertEqual(viewModel.currentIndex, 0)
    }
}
