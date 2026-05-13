import SwiftUI

struct HomeView: View {
    let sampleMovies: [(title: String, year: String, rating: Double, genres: [String])] = [
        ("千と千尋の神隠し", "2001年", 8.6, ["アニメーション", "ファンタジー"]),
        ("となりのトトロ",   "1988年", 8.2, ["アニメーション", "ファミリー"]),
        ("もののけ姫",       "1997年", 8.4, ["アニメーション", "アドベンチャー"]),
        ("風の谷のナウシカ", "1984年", 8.1, ["アニメーション", "SF"]),
        ("ハウルの動く城",   "2004年", 7.9, ["アニメーション", "ロマンス"])
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack(alignment: .leading, spacing: 20) {

                    // 헤더
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("🎬 CineMatch")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.white)
                            Text("現在公開中")
                            
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 60)

                    // 영화 목록
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(sampleMovies, id: \.title) { movie in
                                // NavigationLink로 감싸기
                                NavigationLink {
                                    MovieDetailView(
                                        title: movie.title,
                                        year: movie.year,
                                        rating: movie.rating
                                    )
                                } label: {
                                    MovieCardView(
                                        title: movie.title,
                                        year: movie.year,
                                        rating: movie.rating,
                                        posterPath: nil,
                                        genres: movie.genres
                                    )
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                    }

                    Spacer()
                }
            }
            .navigationBarHidden(true)  // 기본 네비게이션 바 숨기기
        }
    }
}

#Preview {
    HomeView()
}
