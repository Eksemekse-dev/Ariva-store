import Foundation

struct AppModel: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let bundleID: String
    let version: String
    let iconEmoji: String
    let description: String
    let ipaURL: String

    static let samples: [AppModel] = [
        AppModel(name: "Radio Player", bundleID: "dev.eksemekse.radio",
                 version: "1.2.0", iconEmoji: "📻",
                 description: "A simple radio player with public streams.",
                 ipaURL: "https://example.com/radio.ipa"),
        AppModel(name: "Dictionary", bundleID: "dev.eksemekse.dictionary",
                 version: "2.0.1", iconEmoji: "📖",
                 description: "Offline multilingual dictionary.",
                 ipaURL: "https://example.com/dictionary.ipa"),
        AppModel(name: "AR Viewer", bundleID: "dev.eksemekse.arviewer",
                 version: "1.0.5", iconEmoji: "🕶️",
                 description: "Minimal AR viewer for demo purposes.",
                 ipaURL: "https://example.com/arviewer.ipa"),
        AppModel(name: "Recipe Book", bundleID: "dev.eksemekse.recipes",
                 version: "1.1.0", iconEmoji: "🍲",
                 description: "A personal recipe book with categories.",
                 ipaURL: "https://example.com/recipes.ipa")
    ]
}
