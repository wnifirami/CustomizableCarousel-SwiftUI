import SwiftUI

@Observable final class CarouselViewModel {
    var currentIndex: Int = 0
    private var autoPlayTimer: Timer?

    func startAutoPlay(interval: TimeInterval, count: Int, loopsInfinitely: Bool) {
        autoPlayTimer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { [weak self] _ in
            guard let self else { return }
            self.currentIndex = CarouselMath.nextIndex(
                from: self.currentIndex,
                count: count,
                loopsInfinitely: loopsInfinitely
            )
        }
    }

    func stopAutoPlay() {
        autoPlayTimer?.invalidate()
        autoPlayTimer = nil
    }

    func advance(count: Int, loopsInfinitely: Bool) {
        currentIndex = CarouselMath.nextIndex(from: currentIndex, count: count, loopsInfinitely: loopsInfinitely)
    }

    func retreat(count: Int, loopsInfinitely: Bool) {
        currentIndex = CarouselMath.previousIndex(from: currentIndex, count: count, loopsInfinitely: loopsInfinitely)
    }
}
