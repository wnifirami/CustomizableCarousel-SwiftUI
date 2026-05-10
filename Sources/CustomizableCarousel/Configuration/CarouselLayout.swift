import SwiftUI

public struct CarouselLayout: Equatable {
    public var cardWidthRatio: CGFloat
    public var cardHeight: CGFloat
    public var cardSpacing: CGFloat
    public var peekPadding: CGFloat
    public var cardCornerRadius: CGFloat
    public var indicatorActiveWidth: CGFloat
    public var indicatorHeight: CGFloat

    public init(
        cardWidthRatio: CGFloat = 0.78,
        cardHeight: CGFloat = 180,
        cardSpacing: CGFloat = 12,
        peekPadding: CGFloat = 32,
        cardCornerRadius: CGFloat = 20,
        indicatorActiveWidth: CGFloat = 20,
        indicatorHeight: CGFloat = 5
    ) {
        self.cardWidthRatio = cardWidthRatio
        self.cardHeight = cardHeight
        self.cardSpacing = cardSpacing
        self.peekPadding = peekPadding
        self.cardCornerRadius = cardCornerRadius
        self.indicatorActiveWidth = indicatorActiveWidth
        self.indicatorHeight = indicatorHeight
    }
}
