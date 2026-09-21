import SwiftUI

struct HomeView: View {
    @EnvironmentObject var sourceManager: SourceManager
    @EnvironmentObject var vpnManager: VPNManager

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    header
                    featuredSection
                    sourcesSection
                    footer
                }
                .padding()
            }
            .navigationTitle("Ariva-Store")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    vpnStatusBadge
                }
            }
        }
    }

    private var vpnStatusBadge: some View {
        HStack(spacing: 6) {
            Circle()
                .fill(vpnManager.isConnected ? Color.green : Color.red)
                .frame(width: 10, height: 10)
                .shadow(
                    color: (vpnManager.isConnected ? Color.green : Color.red).opacity(0.7),
                    radius: 5
                )
            Text(vpnManager.isConnected ? "VPN" : "OFF")
                .font(.caption2.bold())
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(.ultraThinMaterial, in: Capsule())
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Welcome to Ariva-Store")
                .font(.largeTitle.bold())
                .foregroundStyle(.orange)
            Text("Sideload IPA apps on your iPhone — safely and simply.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }

    private var featuredSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Featured").font(.title2.bold())
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(AppModel.samples) { app in
                        FeaturedCard(app: app)
                    }
                }
            }
        }
    }

    private var sourcesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Sources").font(.title2.bold())
            ForEach(sourceManager.sources) { src in
                HStack {
                    Image(systemName: "link.circle.fill").foregroundStyle(.orange)
                    Text(src.name)
                    Spacer()
                    Text("\(src.appCount)").foregroundStyle(.secondary)
                }
                .padding()
                .background(Color.gray.opacity(0.15))
                .cornerRadius(12)
            }
        }
    }

    private var footer: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Author: Eksemekse-dev")
                .font(.footnote)
                .foregroundStyle(.secondary)
            Text("This app was created with the help of AI. It is not intended for piracy and does not support it.")
                .font(.caption2)
                .foregroundStyle(.tertiary)
        }
        .padding(.top, 24)
        .padding(.bottom, 24)
    }
}

struct FeaturedCard: View {
    let app: AppModel
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: 16)
                .fill(LinearGradient(colors: [.orange, .red],
                                     startPoint: .topLeading,
                                     endPoint: .bottomTrailing))
                .frame(width: 160, height: 160)
                .overlay(Text(app.iconEmoji).font(.system(size: 60)))
            Text(app.name).font(.headline)
            Text(app.bundleID).font(.caption).foregroundStyle(.secondary)
        }
        .frame(width: 160)
    }
}
