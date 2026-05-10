# CustomizableCarousel

A fully customizable, gesture-driven paged carousel for SwiftUI with smooth spring animations, peek effects, and a flexible configuration system.

---

## Preview

<p align="center">
  <img src="Screenshots/main.png" width="30%" alt="Default carousel" />
  &nbsp;&nbsp;
  <img src="Screenshots/themes.png" width="30%" alt="Theme presets" />
  &nbsp;&nbsp;
  <img src="Screenshots/settings.png" width="30%" alt="Configuration sheet" />
</p>

---

## Features

- **Snap-to-page gestures** — drag or flick; both a distance threshold and a velocity threshold trigger a page turn
- **Peek effect** — adjacent cards are partially visible, configurable via padding and width ratio
- **Built-in presets** — `.minimal`, `.hero`, `.compact`, and `.autoPlay` out of the box
- **Auto-play** — optional timer-driven page advancement with infinite looping support
- **Page indicator** — animated capsule dot that follows the active page
- **Navigation buttons** — optional previous / next chevron buttons
- **Zero dependencies** — pure SwiftUI, no third-party packages

---

## Requirements

| | Minimum |
|---|---|
| iOS | 17.0 |
| macOS | 14.0 |
| Swift | 5.9 |
| Xcode | 15.0 |

---

## Installation

### Swift Package Manager

**Xcode:** File → Add Package Dependencies, paste the URL below, select *Up to Next Major Version* from `1.0.0`.

```
https://github.com/ramiounifi/CustomizableCarousel.git
```

**Package.swift:**

```swift
dependencies: [
    .package(url: "https://github.com/ramiounifi/CustomizableCarousel.git", from: "1.0.0")
],
targets: [
    .target(name: "YourApp", dependencies: ["CustomizableCarousel"])
]
```

---

## Quick start

```swift
import SwiftUI
import CustomizableCarousel

struct MyCard: CarouselItem {
    let id: Int
    let title: String
    var indicatorColor: Color { .blue }
}

struct ContentView: View {
    private let cards = [
        MyCard(id: 0, title: "First"),
        MyCard(id: 1, title: "Second"),
        MyCard(id: 2, title: "Third"),
    ]

    var body: some View {
        CarouselView(items: cards) { card, isActive in
            RoundedRectangle(cornerRadius: 20)
                .fill(isActive ? Color.blue : Color.gray)
                .overlay(Text(card.title).foregroundColor(.white))
        }
    }
}
```

---

## Configuration

Every visual property comes from `CarouselConfiguration`. Start from `.default` and mutate only what you need.

```swift
var config = CarouselConfiguration.default
config.colors.indicatorActive = .orange
config.appearance.showsNavigationButtons = false
config.behavior.loopsInfinitely = true

CarouselView(items: cards, configuration: config) { card, isActive in
    MyCardView(card: card)
}
```

Configuration is a value type — assigning a new value updates the component live.

### Built-in presets

```swift
CarouselView(items: cards, configuration: .minimal)   // indicator only, no arrows
CarouselView(items: cards, configuration: .hero)      // large cards, full-bleed
CarouselView(items: cards, configuration: .compact)   // small cards, side strip
CarouselView(items: cards, configuration: .autoPlay)  // 3-second auto-advance
```

### Define your own preset

```swift
extension CarouselConfiguration {
    static var brand: CarouselConfiguration {
        var config = CarouselConfiguration.default
        config.colors.indicatorActive = Color(red: 0.42, green: 0.13, blue: 0.63)
        config.layout.cardCornerRadius = 28
        return config
    }
}
```

---

## CarouselConfiguration reference

### Colors — `config.colors`

| Property | Default | Description |
|---|---|---|
| `indicatorActive` | `nil` | Active dot color. `nil` uses each item's `indicatorColor`. |
| `indicatorInactive` | `.gray.opacity(0.3)` | Inactive dot color |

### Layout — `config.layout`

| Property | Default | Description |
|---|---|---|
| `cardWidthRatio` | `0.78` | Card width as a fraction of the available width |
| `cardHeight` | `180` | Card height in points |
| `cardSpacing` | `12` | Gap between cards in points |
| `peekPadding` | `32` | Horizontal padding that reveals adjacent cards |
| `cardCornerRadius` | `20` | Card corner radius in points |
| `indicatorActiveWidth` | `20` | Width of the active indicator capsule |
| `indicatorHeight` | `5` | Height of all indicator dots |

### Animation — `config.animation`

| Property | Default | Description |
|---|---|---|
| `springResponse` | `0.38` | Spring response time |
| `springDamping` | `0.74` | Spring damping fraction |
| `rubberBandFactor` | `0.2` | Resistance multiplier at boundary edges |

### Appearance — `config.appearance`

| Property | Default | Description |
|---|---|---|
| `showsIndicator` | `true` | Whether to show the page indicator |
| `showsNavigationButtons` | `true` | Whether to show previous / next buttons |
| `inactiveScale` | `0.88` | Scale applied to non-active cards |
| `inactiveOpacity` | `1.0` | Opacity applied to non-active cards |

### Behavior — `config.behavior`

| Property | Default | Description |
|---|---|---|
| `swipeDistanceThreshold` | `30` | Minimum drag distance (pts) to advance a page |
| `swipeVelocityThreshold` | `300` | Minimum flick velocity (pts/s) to advance a page |
| `loopsInfinitely` | `false` | Whether swiping wraps from last to first |
| `autoPlayInterval` | `nil` | Seconds between automatic page advances. `nil` disables auto-play. |

---

## CarouselView parameters

| Parameter | Type | Default | Description |
|---|---|---|---|
| `items` | `[Item]` | — | The data to display (required) |
| `configuration` | `CarouselConfiguration` | `.default` | Visual and behavioural configuration |
| `cardContent` | `(Item, Bool) -> Content` | — | Card view builder; second param is `true` when the card is active |

---

## CarouselItem protocol

Adopt `CarouselItem` to make your model work with `CarouselView`:

```swift
public protocol CarouselItem: Identifiable {
    var indicatorColor: Color { get }
}
```

`indicatorColor` is used as the active dot color when `config.colors.indicatorActive` is `nil`, letting each card drive its own accent.

---

## Project structure

```
CustomizableCarousel/
├── Package.swift
├── Sources/CustomizableCarousel/
│   ├── CarouselView.swift             ← public entry point
│   ├── CarouselViewModel.swift        ← internal state
│   ├── CarouselItem.swift             ← public protocol
│   ├── Configuration/
│   │   ├── CarouselConfiguration.swift
│   │   ├── CarouselColors.swift
│   │   ├── CarouselLayout.swift
│   │   ├── CarouselAnimation.swift
│   │   ├── CarouselAppearance.swift
│   │   └── CarouselBehavior.swift
│   ├── Views/
│   │   ├── SnapTrackView.swift
│   │   ├── CarouselIndicatorView.swift
│   │   ├── NavButtonsView.swift
│   │   └── NavButtonView.swift
│   └── Helpers/
│       ├── CarouselMath.swift
│       └── Color+Hex.swift
├── Example/
│   ├── ExampleApp.swift
│   ├── ContentView.swift
│   ├── ConfigurationSheet.swift
│   ├── ConfigurationPreset.swift
│   ├── CarouselConfiguration+Presets.swift
│   ├── FeatureCard.swift
│   └── CardCell.swift
└── CustomizableCarouselTests/
```

---

## Running the example

Open `CustomizableCarousel/CustomizableCarousel.xcodeproj` in Xcode 15+, select the **CustomizableCarousel** scheme, and run on an iOS 17+ simulator.

---

## License

MIT — see [LICENSE](LICENSE).

© 2026 Rami Ounifi
