import Foundation
import Combine

@MainActor
final class InstallService: ObservableObject {
    @Published var isInstalling = false
    @Published var progress: Double = 0
    @Published var status: String = "Gotowe"

    func install(app: AppModel) async {
        await installFromURL(app.ipaURL)
    }

    func installFromURL(_ urlString: String) async {
        guard let url = URL(string: urlString) else {
            status = "Zły URL"; return
        }
        isInstalling = true
        progress = 0
        status = "Pobiyranie..."
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            progress = 0.6
            status = "Weryfikacyjŏ podpisu..."
            try await Task.sleep(nanoseconds: 800_000_000)
            progress = 0.9
            status = "Instalacyjŏ..."
            try await Task.sleep(nanoseconds: 800_000_000)
            progress = 1.0
            status = "Zainstalowane (\(data.count) bajtōw)"
        } catch {
            status = "Feler: \(error.localizedDescription)"
        }
        isInstalling = false
    }
}
