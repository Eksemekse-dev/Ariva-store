import SwiftUI

struct HomeView: View {
    @EnvironmentObject var sourceManager: SourceManager

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    header
                    featuredSection
                    sourcesSection
                }
                .padding()
            }
            .background(Color.black.ignoresSafeArea())
            .navigationTitle("Ariva-Store")
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Witej w Ariva-Store")
                .font(.largeTitle.bold())
                .foregroundStyle(.orange)
            Text("Sideloading IPA dlŏ ślōnskij kultury")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }

    private var featuredSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Polecane").font(.title2.bold())
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
            Text("Zdrzōdła").font(.title2.bold())
            ForEach(sourceManager.sources) { src in
                HStack {
                    Image(systemName: "link.circle.fill").foregroundStyle(.orange)
                    Text(src.name)
                    Spacer()
                    Text("\(src.appCount)")
                        .foregroundStyle(.secondary)
                }
                .padding()
                .background(Color.gray.opacity(0.15))
                .cornerRadius(12)
            }
        }
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
