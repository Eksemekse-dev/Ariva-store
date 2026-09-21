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
        AppModel(name: "Ślōnsk Radio", bundleID: "pl.ariva.radio",
                 version: "1.2.0", iconEmoji: "📻",
                 description: "Radijŏ ze Ślōnska — muzyka, godka, tradycyjŏ.",
                 ipaURL: "https://example.com/radio.ipa"),
        AppModel(name: "Godka Ślōnskŏ", bundleID: "pl.ariva.godka",
                 version: "2.0.1", iconEmoji: "📖",
                 description: "Słownik i kurs ślōnskij godki.",
                 ipaURL: "https://example.com/godka.ipa"),
        AppModel(name: "Barbórka AR", bundleID: "pl.ariva.barborka",
                 version: "1.0.5", iconEmoji: "⛏️",
                 description: "Rozszerzōnŏ rzeczywistość na Barbórkã.",
                 ipaURL: "https://example.com/barborka.ipa"),
        AppModel(name: "Ślōnskŏ Kuchnia", bundleID: "pl.ariva.kuchnia",
                 version: "1.1.0", iconEmoji: "🍲",
                 description: "Tradycyjne recepty: rolada, kluski, modrŏ kapusta.",
                 ipaURL: "https://example.com/kuchnia.ipa")
    ]
}
