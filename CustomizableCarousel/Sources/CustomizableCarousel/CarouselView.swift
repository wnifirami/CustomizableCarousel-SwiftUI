import SwiftUI

/// A paged carousel that displays items in a horizontally scrollable strip with snap behaviour.
public struct CarouselView<Item: CarouselItem, CardContent: View>: View {

    private let items: [Item]
    private let configuration: CarouselConfiguration
    private let cardContent: (Item, Bool) -> CardContent

    @State private var viewModel = CarouselViewModel()

    /// Creates a carousel.
    /// - Parameters:
    ///   - items: The data to display.
    ///   - configuration: Visual and behavioural configuration. Defaults to `.default`.
    ///   - cardContent: A view builder that produces the card for a given item and whether it is the active card.
    public init(
        items: [Item],
        configuration: CarouselConfiguration = .default,
        @ViewBuilder cardContent: @escaping (Item, Bool) -> CardContent
    ) {
        self.items = items
        self.configuration = configuration
        self.cardContent = cardContent
    }

    public var body: some View {
        VStack(spacing: 0) {
            SnapTrackView(
                items: items,
                configuration: configuration,
                viewModel: viewModel,
                cardContent: cardContent
            )

            if configuration.appearance.showsIndicator {
                CarouselIndicatorView(
                    count: items.count,
                    currentIndex: viewModel.currentIndex,
                    configuration: configuration,
                    activeColor: resolvedIndicatorColor
                )
                .equatable()
                .padding(.top, 14)
            }

            if configuration.appearance.showsNavigationButtons {
                NavButtonsView(
                    viewModel: viewModel,
                    count: items.count,
                    configuration: configuration
                )
                .padding(.top, 12)
            }
        }
        .onAppear {
            guard let interval = configuration.behavior.autoPlayInterval else { return }
            viewModel.startAutoPlay(
                interval: interval,
                count: items.count,
                loopsInfinitely: configuration.behavior.loopsInfinitely
            )
        }
        .onDisappear {
            viewModel.stopAutoPlay()
        }
    }

    private var resolvedIndicatorColor: Color {
        if let color = configuration.colors.indicatorActive { return color }
        guard !items.isEmpty else { return .accentColor }
        return items[min(viewModel.currentIndex, items.count - 1)].indicatorColor
    }
}
