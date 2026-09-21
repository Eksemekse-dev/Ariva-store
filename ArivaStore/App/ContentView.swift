import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home

    enum Tab { case home, apps, install, settings }

    var body: some View {
        ZStack {
            // Full-screen background — fixes the "floating tab bar" look
            Color.black
                .ignoresSafeArea(.all)

            TabView(selection: $selection) {
                HomeView()
                    .tabItem { Label("Home", systemImage: "house.fill") }
                    .tag(Tab.home)

                AppsListView()
                    .tabItem { Label("Apps", systemImage: "square.grid.2x2.fill") }
                    .tag(Tab.apps)

                InstallView()
                    .tabItem { Label("Install", systemImage: "arrow.down.app.fill") }
                    .tag(Tab.install)

                SettingsView()
                    .tabItem { Label("Settings", systemImage: "gearshape.fill") }
                    .tag(Tab.settings)
            }
            .tint(.orange)
            .toolbarBackground(.black, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
    }
}
