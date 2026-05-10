/// The complete visual and behavioural configuration for `CarouselView`.
public struct CarouselConfiguration: Equatable {
    public var colors: CarouselColors
    public var layout: CarouselLayout
    public var animation: CarouselAnimation
    public var appearance: CarouselAppearance
    public var behavior: CarouselBehavior

    public static let `default` = CarouselConfiguration()

    public init(
        colors: CarouselColors = CarouselColors(),
        layout: CarouselLayout = CarouselLayout(),
        animation: CarouselAnimation = CarouselAnimation(),
        appearance: CarouselAppearance = CarouselAppearance(),
        behavior: CarouselBehavior = CarouselBehavior()
    ) {
        self.colors = colors
        self.layout = layout
        self.animation = animation
        self.appearance = appearance
        self.behavior = behavior
    }
}
