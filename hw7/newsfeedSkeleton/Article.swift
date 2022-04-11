//
//  Article.swift
//  newsfeedSkeleton
//
//  Created by Vibha Dabholkar on 4/10/22.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let id: UUID = UUID()
    let author: String?
    let url: String
    let source, title, articleDescription: String
    let image: String
    let date: Date

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}
