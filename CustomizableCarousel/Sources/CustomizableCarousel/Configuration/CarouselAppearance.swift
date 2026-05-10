import SwiftUI

public struct CarouselAppearance: Equatable {
    public var showsIndicator: Bool
    public var showsNavigationButtons: Bool
    public var inactiveScale: CGFloat
    public var inactiveOpacity: Double

    public init(
        showsIndicator: Bool = true,
        showsNavigationButtons: Bool = true,
        inactiveScale: CGFloat = 0.88,
        inactiveOpacity: Double = 1.0
    ) {
        self.showsIndicator = showsIndicator
        self.showsNavigationButtons = showsNavigationButtons
        self.inactiveScale = inactiveScale
        self.inactiveOpacity = inactiveOpacity
    }
}
