//
//  Genre.swift
//  CineMatch
//
//  Created by 윤병일 on 2026/04/23.
//

import Foundation

struct Genre: Identifiable, Codable, Hashable {
    let id: Int
    let name: String
}

struct GenreResponse: Codable {
    let genres: [Genre]
}

extension Genre {
    static let allGenres: [Genre] = [
        Genre(id: 28,    name: "アクション"),
        Genre(id: 12,    name: "アドベンチャー"),
        Genre(id: 16,    name: "アニメーション"),
        Genre(id: 35,    name: "コメディ"),
        Genre(id: 80,    name: "犯罪"),
        Genre(id: 18,    name: "ドラマ"),
        Genre(id: 14,    name: "ファンタジー"),
        Genre(id: 27,    name: "ホラー"),
        Genre(id: 9648,  name: "ミステリー"),
        Genre(id: 10749, name: "ロマンス"),
        Genre(id: 878,   name: "SF"),
        Genre(id: 53,    name: "スリラー"),
        Genre(id: 10752, name: "戦争"),
        Genre(id: 36,    name: "歴史")
    ]
    
    static let nameByID: [Int: String] = {
        var dict: [Int: String] = [:]
        for genre in allGenres {
            dict[genre.id] = genre.name
        }
        return dict
    }()
}
