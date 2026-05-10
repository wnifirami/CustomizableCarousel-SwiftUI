import SwiftUI

struct ConfigurationSheet: View {
    @Binding var activePreset: ConfigurationPreset
    @Binding var showsIndicator: Bool
    @Binding var showsNavigationButtons: Bool
    @Binding var loopsInfinitely: Bool

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            Form {
                Section("Preset") {
                    ForEach(ConfigurationPreset.allCases, id: \.self) { preset in
                        Button {
                            activePreset = preset
                        } label: {
                            HStack {
                                Text(preset.rawValue)
                                Spacer()
                                if preset == activePreset {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.accentColor)
                                }
                            }
                        }
                        .foregroundColor(.primary)
                    }
                }

                Section("Appearance") {
                    Toggle("Indicator", isOn: $showsIndicator)
                    Toggle("Navigation Buttons", isOn: $showsNavigationButtons)
                    Toggle("Loop Infinitely", isOn: $loopsInfinitely)
                }
            }
            .navigationTitle("Configuration")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}
