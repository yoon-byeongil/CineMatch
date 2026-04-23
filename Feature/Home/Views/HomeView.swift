//
//  HomeView.swift
//  CineMatch
//
//  Created by 윤병일 on 2026/04/23.
//

import SwiftUI

struct HomeView: View {
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
                        ForEach(0..<5) { index in
                            placeholderCard(index: index)
                        }
                    }
                    .padding(.horizontal, 20)
                }
                
                Spacer()
            }
        }
    }
    
    //임시 카드
    func placeholderCard(index: Int) -> some View {
        HStack(spacing: 12) {
            //posrer
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 80, height: 120)
            
            //information
            VStack(alignment: .leading, spacing: 6) {
                Text("映画タイトル \(index + 1)")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text("2024年")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.caption)
                    Text("8.5")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
        }
        .padding(12)
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
}
