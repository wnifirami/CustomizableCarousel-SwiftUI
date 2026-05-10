import SwiftUI

struct NavButtonView: View, Equatable {
    let icon: String
    let isDisabled: Bool
    let action: () -> Void

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.icon == rhs.icon && lhs.isDisabled == rhs.isDisabled
    }

    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(isDisabled ? .secondary.opacity(0.3) : .secondary)
                .frame(width: 36, height: 36)
                .background(Color.secondary.opacity(0.12))
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.secondary.opacity(0.25), lineWidth: 0.5))
        }
        .disabled(isDisabled)
        .buttonStyle(.plain)
    }
}
