import SwiftUI

struct MovieDetailView: View {
    let title: String
    let year: String
    let rating: Double

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 20) {
                // 임시 포스터 자리
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 300)
                    .overlay(
                        Image(systemName: "film")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                    )
                    .padding(.horizontal, 20)

                // 영화 정보
                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)

                    HStack(spacing: 12) {
                        Text(year)
                            .foregroundColor(.gray)

                        HStack(spacing: 4) {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text(String(format: "%.1f", rating))
                                .foregroundColor(.gray)
                        }
                    }
                    .font(.subheadline)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)

                Spacer()
            }
            .padding(.top, 20)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        MovieDetailView(
            title: "千と千尋の神隠し",
            year: "2001年",
            rating: 8.6
        )
    }
    .preferredColorScheme(.dark)
}
