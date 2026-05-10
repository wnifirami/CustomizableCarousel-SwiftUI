import SwiftUI

public struct CarouselAnimation: Equatable {
    public var springResponse: Double
    public var springDamping: Double
    public var rubberBandFactor: CGFloat

    public init(
        springResponse: Double = 0.38,
        springDamping: Double = 0.74,
        rubberBandFactor: CGFloat = 0.2
    ) {
        self.springResponse = springResponse
        self.springDamping = springDamping
        self.rubberBandFactor = rubberBandFactor
    }
}
