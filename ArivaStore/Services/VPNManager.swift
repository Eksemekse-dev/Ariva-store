import Foundation
import NetworkExtension
import Combine

@MainActor
final class VPNManager: ObservableObject {
    @Published var isConnected = false
    @Published var statusText = "Disconnected"

    // Requires entitlement: com.apple.developer.networking.networkextension
    func toggle() {
        isConnected.toggle()
        statusText = isConnected ? "Connected" : "Disconnected"
        if isConnected {
            startTunnel()
        } else {
            stopTunnel()
        }
    }

    private func startTunnel() {
        // Hook for external VPN (WireGuard / OpenVPN / custom provider).
        print("[Ariva] VPN start")
    }

    private func stopTunnel() {
        print("[Ariva] VPN stop")
    }
}
