import SwiftUI

struct SnapTrackView<Item: CarouselItem, CardContent: View>: View {
    let items: [Item]
    let configuration: CarouselConfiguration
    var viewModel: CarouselViewModel
    let cardContent: (Item, Bool) -> CardContent

    // Position is driven entirely by @State so both changes land in one animation transaction.
    // viewModel.currentIndex is kept in sync as a side-effect for the indicator / nav buttons.
    @State private var activeIndex: Int = 0
    @State private var dragOffset: CGFloat = 0

    var body: some View {
        GeometryReader { geometry in
            let cardWidth = geometry.size.width * configuration.layout.cardWidthRatio
            let step = cardWidth + configuration.layout.cardSpacing

            ZStack {
                ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                    let relative = CGFloat(index - activeIndex)
                    let isActive = index == activeIndex

                    cardContent(item, isActive)
                        .frame(width: cardWidth, height: configuration.layout.cardHeight)
                        .clipShape(RoundedRectangle(cornerRadius: configuration.layout.cardCornerRadius))
                        .scaleEffect(isActive ? 1.0 : configuration.appearance.inactiveScale)
                        .opacity(abs(relative) <= 1.6
                            ? (isActive ? 1.0 : configuration.appearance.inactiveOpacity)
                            : 0.0)
                        .offset(x: relative * step + dragOffset)
                        .zIndex(isActive ? 1 : 0)
                }
            }
            .frame(width: geometry.size.width, height: configuration.layout.cardHeight)
            .contentShape(Rectangle())
            .gesture(swipeGesture)
        }
        .frame(height: configuration.layout.cardHeight)
        .padding(.horizontal, configuration.layout.peekPadding)
        .clipped()
        .onChange(of: viewModel.currentIndex) { _, newIndex in
            guard newIndex != activeIndex else { return }
            withAnimation(.spring(response: configuration.animation.springResponse,
                                  dampingFraction: configuration.animation.springDamping)) {
                activeIndex = newIndex
                dragOffset = 0
            }
        }
    }

    private var swipeGesture: some Gesture {
        DragGesture(minimumDistance: 5)
            .onChanged { value in
                let raw = value.translation.width
                let atLeft = activeIndex == 0 && raw > 0
                let atRight = activeIndex == items.count - 1 && raw < 0
                let shouldRubberBand = !configuration.behavior.loopsInfinitely && (atLeft || atRight)
                dragOffset = shouldRubberBand ? raw * configuration.animation.rubberBandFactor : raw
            }
            .onEnded { value in
                let distance = value.translation.width
                let velocity = value.predictedEndTranslation.width - value.translation.width
                let shouldAdvance = abs(distance) > configuration.behavior.swipeDistanceThreshold
                                 || abs(velocity) > configuration.behavior.swipeVelocityThreshold

                var newIndex = activeIndex
                if shouldAdvance {
                    newIndex = distance < 0
                        ? CarouselMath.nextIndex(from: activeIndex, count: items.count, loopsInfinitely: configuration.behavior.loopsInfinitely)
                        : CarouselMath.previousIndex(from: activeIndex, count: items.count, loopsInfinitely: configuration.behavior.loopsInfinitely)
                }

                // Both @State changes animate in one transaction — no split-pass glitch
                withAnimation(.spring(response: configuration.animation.springResponse,
                                      dampingFraction: configuration.animation.springDamping)) {
                    activeIndex = newIndex
                    dragOffset = 0
                }
                viewModel.currentIndex = newIndex
            }
    }
}
