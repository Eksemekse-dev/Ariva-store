import Foundation
import NetworkExtension
import Combine

@MainActor
final class VPNManager: ObservableObject {
    @Published var isConnected = false
    @Published var statusText = "Rozłōnczōny"

    // Wymaga entitlement: com.apple.developer.networking.networkextension
    func toggle() {
        isConnected.toggle()
        statusText = isConnected ? "Połōnczōny" : "Rozłōnczōny"
        if isConnected {
            startTunnel()
        } else {
            stopTunnel()
        }
    }

    private func startTunnel() {
        // Miejsce na integrację z zewnętrznym VPN (WireGuard / OpenVPN)
        // NEPacketTunnelProviderManager.shared().loadFromPreferences...
        print("[Ariva] VPN start")
    }

    private func stopTunnel() {
        print("[Ariva] VPN stop")
    }
}
