import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home

    enum Tab { case home, apps, install, settings }

    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem { Label("Dóm", systemImage: "house.fill") }
                .tag(Tab.home)

            AppsListView()
                .tabItem { Label("Aplikacyje", systemImage: "square.grid.2x2.fill") }
                .tag(Tab.apps)

            InstallView()
                .tabItem { Label("Instalacyjŏ", systemImage: "arrow.down.app.fill") }
                .tag(Tab.install)

            SettingsView()
                .tabItem { Label("Sztelōnki", systemImage: "gearshape.fill") }
                .tag(Tab.settings)
        }
        .tint(.orange)
    }
}
