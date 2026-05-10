import SwiftUI

struct CarouselIndicatorView: View, Equatable {
    let count: Int
    let currentIndex: Int
    let configuration: CarouselConfiguration
    let activeColor: Color

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.count == rhs.count &&
        lhs.currentIndex == rhs.currentIndex &&
        lhs.configuration == rhs.configuration &&
        lhs.activeColor == rhs.activeColor
    }

    var body: some View {
        HStack(spacing: 6) {
            ForEach(0..<count, id: \.self) { index in
                if index == currentIndex {
                    Capsule()
                        .fill(activeColor)
                        .frame(width: configuration.layout.indicatorActiveWidth,
                               height: configuration.layout.indicatorHeight)
                } else {
                    Circle()
                        .fill(configuration.colors.indicatorInactive)
                        .frame(width: configuration.layout.indicatorHeight,
                               height: configuration.layout.indicatorHeight)
                }
            }
        }
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: currentIndex)
    }
}
