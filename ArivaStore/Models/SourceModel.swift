import Foundation

struct SourceModel: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let url: String
    let appCount: Int
}
