import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var sourceManager: SourceManager
    @AppStorage("autoInstall") private var autoInstall = false
    @AppStorage("devMode") private var devMode = false

    var body: some View {
        NavigationStack {
            Form {
                Section("IPA Sources") {
                    ForEach(sourceManager.sources) { s in
                        Text(s.name)
                    }
                    Button("Add source") { sourceManager.addSource() }
                }
                Section("Options") {
                    Toggle("Auto-install", isOn: $autoInstall)
                    Toggle("Developer mode", isOn: $devMode)
                }
                Section("About") {
                    LabeledContent("Version", value: "1.0.0")
                    LabeledContent("Author", value: "Eksemekse-dev")
                    Text("This app was created with the help of AI. It is not intended for piracy and does not support it.")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Settings")
        }
    }
}
