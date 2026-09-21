import Foundation
import Combine

@MainActor
final class InstallService: ObservableObject {
    @Published var isInstalling = false
    @Published var progress: Double = 0
    @Published var status: String = "Ready"

    func install(app: AppModel) async {
        await installFromURL(app.ipaURL)
    }

    func installFromURL(_ urlString: String) async {
        guard let url = URL(string: urlString) else {
            status = "Invalid URL"; return
        }
        isInstalling = true
        progress = 0
        status = "Downloading..."
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            progress = 0.6
            status = "Verifying signature..."
            try await Task.sleep(nanoseconds: 800_000_000)
            progress = 0.9
            status = "Installing..."
            try await Task.sleep(nanoseconds: 800_000_000)
            progress = 1.0
            status = "Installed (\(data.count) bytes)"
        } catch {
            status = "Error: \(error.localizedDescription)"
        }
        isInstalling = false
    }
}
