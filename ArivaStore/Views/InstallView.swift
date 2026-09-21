import SwiftUI

struct InstallView: View {
    @EnvironmentObject var installService: InstallService
    @EnvironmentObject var vpnManager: VPNManager
    @State private var ipaURL = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                vpnStatusCard

                TextField("https://.../app.ipa", text: $ipaURL)
                    .textFieldStyle(.roundedBorder)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)

                Button {
                    Task { await installService.installFromURL(ipaURL) }
                } label: {
                    Label("Install from URL", systemImage: "link")
                        .frame(maxWidth: .infinity).padding()
                        .background(Color.orange).foregroundStyle(.black)
                        .cornerRadius(14)
                }
                .disabled(ipaURL.isEmpty || !vpnManager.isConnected)

                if installService.isInstalling {
                    ProgressView(value: installService.progress)
                    Text(installService.status).font(.caption)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Install")
        }
    }

    private var vpnStatusCard: some View {
        HStack {
            Circle()
                .fill(vpnManager.isConnected ? .green : .red)
                .frame(width: 12, height: 12)
            Text(vpnManager.isConnected ? "VPN connected" : "VPN disconnected")
            Spacer()
            Button(vpnManager.isConnected ? "Disconnect" : "Connect") {
                vpnManager.toggle()
            }
        }
        .padding()
        .background(Color.gray.opacity(0.15))
        .cornerRadius(12)
    }
}
