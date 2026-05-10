import SwiftUI

extension CarouselConfiguration {
    static var minimal: CarouselConfiguration {
        var config = CarouselConfiguration.default
        config.appearance.showsNavigationButtons = false
        return config
    }

    static var hero: CarouselConfiguration {
        var config = CarouselConfiguration.default
        config.layout.cardWidthRatio = 0.92
        config.layout.cardHeight = 240
        config.layout.peekPadding = 16
        config.layout.cardCornerRadius = 28
        return config
    }

    static var compact: CarouselConfiguration {
        var config = CarouselConfiguration.default
        config.layout.cardWidthRatio = 0.60
        config.layout.cardHeight = 120
        config.layout.cardSpacing = 10
        config.layout.peekPadding = 48
        config.layout.cardCornerRadius = 12
        config.appearance.inactiveScale = 0.82
        config.appearance.showsNavigationButtons = false
        return config
    }

    static var autoPlay: CarouselConfiguration {
        var config = CarouselConfiguration.default
        config.behavior.autoPlayInterval = 3
        return config
    }
}
