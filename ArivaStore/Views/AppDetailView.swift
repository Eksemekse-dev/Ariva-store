import SwiftUI

struct AppDetailView: View {
    let app: AppModel
    @EnvironmentObject var installService: InstallService
    @EnvironmentObject var vpnManager: VPNManager

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text(app.iconEmoji).font(.system(size: 100))
                Text(app.name).font(.largeTitle.bold())
                Text(app.bundleID).font(.caption).foregroundStyle(.secondary)

                if !vpnManager.isConnected {
                    Label("Connect VPN to install", systemImage: "exclamationmark.triangle")
                        .foregroundStyle(.yellow)
                        .padding()
                        .background(Color.yellow.opacity(0.15))
                        .cornerRadius(12)
                }

                Button {
                    Task { await installService.install(app: app) }
                } label: {
                    Label("Install", systemImage: "arrow.down.circle.fill")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .foregroundStyle(.black)
                        .cornerRadius(14)
                }
                .disabled(!vpnManager.isConnected)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Description").font(.headline)
                    Text(app.description).foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
        }
        .navigationTitle(app.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
