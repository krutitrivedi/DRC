//
//  NewsModelItem.swift
//  DemoDRC


import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let status: String
    let totalResults: Int
    let articles: [Articles]
}

// MARK: - Article
struct Articles : Codable {
    let source : Source?
    let author : String?
    let title : String?
    let description : String?
    let url : String?
    let urlToImage : String?
    let publishedAt : String?
    let content : String?

    enum CodingKeys: String, CodingKey {

        case source = "source"
        case author = "author"
        case title = "title"
        case description = "description"
        case url = "url"
        case urlToImage = "urlToImage"
        case publishedAt = "publishedAt"
        case content = "content"
    }
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}

