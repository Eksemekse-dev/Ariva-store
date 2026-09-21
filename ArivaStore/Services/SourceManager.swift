import Foundation
import Combine

@MainActor
final class SourceManager: ObservableObject {
    @Published var sources: [SourceModel] = [
        SourceModel(name: "Ariva Official", url: "https://ariva.store/repo.json", appCount: 42),
        SourceModel(name: "Ślōnsk Community", url: "https://slask.dev/repo.json", appCount: 17)
    ]

    func addSource() {
        sources.append(SourceModel(name: "Nowe zdrzōdło",
                                   url: "https://example.com/repo.json",
                                   appCount: 0))
    }
}
