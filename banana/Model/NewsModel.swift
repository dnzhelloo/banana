//
//  NewsModel.swift
//  banana
//
//  Created by Deniz on 4.06.2023.
//


import Foundation

// MARK: - News
struct News: Decodable,Hashable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Decodable,Hashable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct Source: Decodable,Hashable {
    let id: String?
    let name: String
}
