//
//  OnboardingView.swift
//  CineMatch
//
//  Created by 윤병일 on 2026/04/24.
//

import SwiftUI

struct OnboardingView: View {
    @State private var selectedGenre: String? = nil
    
    //나중에 Genre 모델로 교체
    let genres = ["アクション", "コメディ", "ホラー", "ロマンス", "SF", "ドラマ"]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 24) {
                Text("好きなジャンルを選んでください")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 60)
                
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(genres, id: \.self) { genre in
                            GenreButton(
                                title: genre,
                                isSelected: selectedGenre == genre,
                            ) {
                                selectedGenre = genre
                            }
                        }
                    }
                    .padding(.horizontal, 24)
                }
                
                if let genre = selectedGenre {
                    Text("選択中: \(genre)")
                        .foregroundColor(.yellow)
                        .font(.subheadline)
                }
                Spacer()
            }
        }
    }
}

//장르 버튼 컴포넌트
struct GenreButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(isSelected ? .black : .white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(isSelected ? Color.yellow : Color.white.opacity(0.1))
                .cornerRadius(12)
        }
    }
}

#Preview {
    OnboardingView()
}
