import SwiftUI

/// A type that can be displayed in a `CarouselView`.
public protocol CarouselItem: Identifiable {
    var indicatorColor: Color { get }
}
