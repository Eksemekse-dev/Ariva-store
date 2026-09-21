import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var sourceManager: SourceManager
    @AppStorage("autoInstall") private var autoInstall = false
    @AppStorage("devMode") private var devMode = false

    var body: some View {
        NavigationStack {
            Form {
                Section("Zdrzōdła IPA") {
                    ForEach(sourceManager.sources) { s in
                        Text(s.name)
                    }
                    Button("Przidej zdrzōdło") { sourceManager.addSource() }
                }
                Section("Ôpcyje") {
                    Toggle("Auto-instalacyjŏ", isOn: $autoInstall)
                    Toggle("Tryb deweloperski", isOn: $devMode)
                }
                Section("Ô aplikacyji") {
                    LabeledContent("Wersyjŏ", value: "1.0.0")
                    LabeledContent("Autor", value: "Ariva Dev Team")
                }
            }
            .navigationTitle("Sztelōnki")
        }
    }
}
