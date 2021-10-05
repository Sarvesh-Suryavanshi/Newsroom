//
//  NewsArticleModel.swift
//  Newsroom
//
//  Created by Sarvesh Suryavanshi on 06/10/21.
//

import Foundation

struct NewsFeedData: Codable {
    let status: String
    let totalResults: Int
    let articles: [ArticleModel]
}

struct ArticleModel: Codable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: URL
    let urlToImage: URL
    let publishedAt: Date
    let content: String
}

struct Source: Codable {
    let id: String
    let name: String
}
