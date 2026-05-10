import SwiftUI

struct CardCell: View {
    let card: FeatureCard
    let isActive: Bool

    var body: some View {
        ZStack(alignment: .topLeading) {
            card.color
            VStack(alignment: .leading, spacing: 6) {
                Text(card.label.uppercased())
                    .font(.system(size: 11, weight: .medium))
                    .tracking(1.1)
                    .foregroundColor(card.accentColor.opacity(0.65))
                Text(card.title)
                    .font(.system(size: 22, weight: .medium))
                    .foregroundColor(card.accentColor)
                Text(card.subtitle)
                    .font(.system(size: 13))
                    .foregroundColor(card.accentColor.opacity(0.75))
                    .lineLimit(2)
                if isActive {
                    Text("→ active")
                        .font(.system(size: 11))
                        .foregroundColor(card.accentColor.opacity(0.5))
                        .padding(.top, 4)
                        .transition(.opacity)
                }
            }
            .padding(24)
        }
    }
}
