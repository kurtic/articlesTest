//
//  Article.swift
//  ArticlesTest
//
//  Created by Diachenko Ihor on 31.07.2023.
//

import Foundation

struct Article: Identifiable, Equatable {
    var id = UUID()
    let author: String
    let title: String
    let imageURL: String
    let description: String
    let publishedAt: Date
    let source: String
    
    init(id: UUID = UUID(),
         author: String,
         title: String,
         imageURL: String,
         description: String,
         publishedAt: Date,
         source: String) {
        self.id = id
        self.author = author
        self.title = title
        self.imageURL = imageURL
        self.description = description
        self.publishedAt = publishedAt
        self.source = source
    }
    
    init(from response: Response) {
        self.author = response.author ?? ""
        self.title = response.title ?? ""
        self.imageURL = response.urlToImage ?? ""
        self.description = response.description ?? ""
        self.publishedAt = response.publishedAt?.value ?? Date()
        self.source = response.source?.name ?? ""
    }
}

// MARK: - Response
extension Article {
    struct Response: Decodable {
        let author: String?
        let title: String?
        let urlToImage: String?
        let description: String?
        let publishedAt: ISO8601DateCoder?
        let source: Source?
        
        struct Source: Decodable {
            let name: String?
        }
    }
}
