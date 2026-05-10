import SwiftUI

struct FeatureCard: CarouselItem {
    let id: Int
    let label: String
    let title: String
    let subtitle: String
    let color: Color
    let accentColor: Color

    var indicatorColor: Color { color }
}
