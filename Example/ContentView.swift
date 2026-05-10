import SwiftUI

struct ContentView: View {
    @State private var showsConfigurationSheet = false
    @State private var activePreset: ConfigurationPreset = .default
    @State private var showsIndicator = true
    @State private var showsNavigationButtons = true
    @State private var loopsInfinitely = false

    private static let sampleCards: [FeatureCard] = [
        FeatureCard(id: 0, label: "Design one",   title: "Dynamic layouts",  subtitle: "Swipe to explore each card style", color: Color(hex: "#534AB7"), accentColor: Color(hex: "#EEEDFE")),
        FeatureCard(id: 1, label: "Design two",   title: "Smooth gestures",  subtitle: "Drag, swipe or tap the arrows",    color: Color(hex: "#0F6E56"), accentColor: Color(hex: "#E1F5EE")),
        FeatureCard(id: 2, label: "Design three", title: "Page control",     subtitle: "Capsule dot tracks your position", color: Color(hex: "#993556"), accentColor: Color(hex: "#FBEAF0")),
    ]

    private var configuration: CarouselConfiguration {
        var config = activePreset.configuration
        config.appearance.showsIndicator = showsIndicator
        config.appearance.showsNavigationButtons = showsNavigationButtons
        config.behavior.loopsInfinitely = loopsInfinitely
        return config
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 36) {
                    CarouselView(items: Self.sampleCards, configuration: configuration) { card, isActive in
                        CardCell(card: card, isActive: isActive)
                    }

                    sectionLabel("Minimal · no arrows")
                    CarouselView(items: Self.sampleCards, configuration: .minimal) { card, isActive in
                        CardCell(card: card, isActive: isActive)
                    }

                    sectionLabel("Hero cards")
                    CarouselView(items: Self.sampleCards, configuration: .hero) { card, isActive in
                        CardCell(card: card, isActive: isActive)
                    }

                    sectionLabel("Compact strip")
                    CarouselView(items: Self.sampleCards, configuration: .compact) { card, isActive in
                        CardCell(card: card, isActive: isActive)
                    }
                }
                .padding(.vertical, 24)
            }
            .navigationTitle("Carousel")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Theme") { showsConfigurationSheet = true }
                }
            }
            .sheet(isPresented: $showsConfigurationSheet) {
                ConfigurationSheet(
                    activePreset: $activePreset,
                    showsIndicator: $showsIndicator,
                    showsNavigationButtons: $showsNavigationButtons,
                    loopsInfinitely: $loopsInfinitely
                )
            }
        }
    }

    @ViewBuilder
    private func sectionLabel(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 13, weight: .medium))
            .foregroundColor(.secondary)
            .padding(.horizontal, 24)
    }
}

#Preview {
    ContentView()
}
