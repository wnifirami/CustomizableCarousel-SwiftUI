import SwiftUI

public struct CarouselBehavior: Equatable {
    public var swipeDistanceThreshold: CGFloat
    public var swipeVelocityThreshold: CGFloat
    public var loopsInfinitely: Bool
    public var autoPlayInterval: TimeInterval?

    public init(
        swipeDistanceThreshold: CGFloat = 30,
        swipeVelocityThreshold: CGFloat = 300,
        loopsInfinitely: Bool = false,
        autoPlayInterval: TimeInterval? = nil
    ) {
        self.swipeDistanceThreshold = swipeDistanceThreshold
        self.swipeVelocityThreshold = swipeVelocityThreshold
        self.loopsInfinitely = loopsInfinitely
        self.autoPlayInterval = autoPlayInterval
    }
}
