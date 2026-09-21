import SwiftUI

struct AppsListView: View {
    @State private var search = ""
    let apps = AppModel.samples

    var filtered: [AppModel] {
        search.isEmpty ? apps : apps.filter { $0.name.localizedCaseInsensitiveContains(search) }
    }

    var body: some View {
        NavigationStack {
            List(filtered) { app in
                NavigationLink(destination: AppDetailView(app: app)) {
                    HStack(spacing: 12) {
                        Text(app.iconEmoji).font(.system(size: 32))
                        VStack(alignment: .leading) {
                            Text(app.name).font(.headline)
                            Text(app.version).font(.caption).foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Apps")
            .searchable(text: $search, prompt: "Search...")
        }
    }
}
