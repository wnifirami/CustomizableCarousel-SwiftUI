import SwiftUI

public struct CarouselColors: Equatable {
    public var indicatorActive: Color?
    public var indicatorInactive: Color

    public init(
        indicatorActive: Color? = nil,
        indicatorInactive: Color = Color.gray.opacity(0.3)
    ) {
        self.indicatorActive = indicatorActive
        self.indicatorInactive = indicatorInactive
    }
}
