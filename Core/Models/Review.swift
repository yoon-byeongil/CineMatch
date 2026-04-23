//
//  Review.swift
//  CineMatch
//
//  Created by 윤병일 on 2026/04/23.
//

import Foundation

struct Review: Identifiable, Decodable {
    let id: String
    let moiveID: Int
    let athourName: String
    let content: String
    let rating: Double
    let createdAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case moiveID = "movie_id"
        case athourName = "author_name"
        case content
        case rating
        case createdAt = "created_at"
    }
    
    init(moiveID: Int, athourName: String, content: String, rating: Double) {
        self.id = UUID().uuidString
        self.moiveID = moiveID
        self.athourName = athourName
        self.content = content
        self.rating = rating
        self.createdAt = Date()
    }
}

extension Review {
    var startText: String {
        let fullstars = Int(rating)
        let hashalf = rating - Double(fullstars) >= 0.5
        var stars = String(repeating: "*", count: fullstars)
        if hashalf {
            stars += "½"
        }
        return stars
    }
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.locale = Locale(identifier: "ja_JP")
        return formatter.string(from: createdAt)
    }
}
