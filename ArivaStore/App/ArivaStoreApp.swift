import SwiftUI

@main
struct ArivaStoreApp: App {
    @StateObject private var installService = InstallService()
    @StateObject private var vpnManager = VPNManager()
    @StateObject private var sourceManager = SourceManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(installService)
                .environmentObject(vpnManager)
                .environmentObject(sourceManager)
                .preferredColorScheme(.dark)
        }
    }
}
