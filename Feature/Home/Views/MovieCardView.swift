//
//  MovieCardView.swift
//  CineMatch
//
//  Created by 윤병일 on 2026/04/24.
//

import SwiftUI

struct MovieCardView: View {
    let title: String
    let year: String
    let rating: Double
    let posterPath: String?
    
    var posterURL: URL? {
        guard let path = posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500" + path)
    }
    
    var body: some View {

        HStack(spacing: 12) {
            AsyncImage(url: posterURL) { phase in
                switch phase {
                case .empty: //로딩
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.3))
                        .overlay(
                            ProgressView()
                                .tint(.gray)
                        )
                case .success(let image): // 성공
                    image
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(8)
                case .failure: // 실패
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.3))
                        .overlay(
                            Image(systemName: "film")
                                .foregroundColor(.gray)
                        )
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 80, height: 120)
            .clipped()
            
            // 영화 정보
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .lineLimit(2)  // 최대 2줄

                Text(year)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.caption)
                    Text(String(format: "%.1f", rating))
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            .padding(.vertical, 12)
            
            Spacer()
        }
        .padding(.horizontal, 12)
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
}

#Preview {
    VStack(spacing: 12) {
        // 포스터 없는 경우
        MovieCardView(
            title: "千と千尋の神隠し",
            year: "2001年",
            rating: 8.6,
            posterPath: nil
        )
        // 실제 TMDB 포스터 테스트
        MovieCardView(
            title: "となりのトトロ",
            year: "1988年",
            rating: 8.2,
            posterPath: "/rtGDOeG9LzoerkDGZF9dnVeLppL.jpg"
        )
    }
    .padding()
    .preferredColorScheme(.dark)
}
