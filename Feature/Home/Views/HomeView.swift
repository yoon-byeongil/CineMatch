//
//  HomeView.swift
//  CineMatch
//
//  Created by 윤병일 on 2026/04/23.
//

import SwiftUI

struct HomeView: View {
    
    // 임시 데이터 (나중에 ViewModel로 교체)
    let sampleMovies: [(title: String, year: String, rating: Double)] = [
        ("千と千尋の神隠し", "2001年", 8.6),
        ("となりのトトロ",   "1988年", 8.2),
        ("もののけ姫",       "1997年", 8.4),
        ("風の谷のナウシカ", "1984年", 8.1),
        ("ハウルの動く城",   "2004年", 7.9)
    ]

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
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
                
                // 임시 영화 카드
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(sampleMovies, id: \.title) { movie in
                            MovieCardView(
                                title: movie.title,
                                year: movie.year,
                                rating: movie.rating,
                                posterPath: nil
                            )
                        }
                    }
                    .padding(.horizontal, 20)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
}
