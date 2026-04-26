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
    let posterPath: String? // 나중에 교체
    
    var body: some View {
        //임시 포스터 자리
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 80, height: 120)
                .overlay(
                    Image(systemName: "film")
                        .foregroundColor(.gray)
                )
            
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
    MovieCardView(
        title: "千と千尋の神隠し",
        year: "2001年",
        rating: 8.6,
        posterPath: nil
    )
    .preferredColorScheme(.dark)
}
