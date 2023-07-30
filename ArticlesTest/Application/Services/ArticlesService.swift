//
//  ArticlesService.swift
//  ArticlesTest
//
//  Created by Diachenko Ihor on 30.07.2023.
//

import Combine
import Foundation

protocol ArticlesUseCase {
  // TODO
}

final class ArticlesService: ArticlesUseCase {
    
    private enum C {
        static let url = "https://newsapi.org/v2/everything?apiKey=\(C.token)"
        static let token = "3ede5880781943078a5ecb5e51a5ddcc"
    }
    
    func fetchArticles(searchQuery: String = "", from startDate: Date, to endDate: Date) -> AnyPublisher<[Article], Error> {
        Future<[Article], Error> { promise in
            // TODO
        }
    }
}


struct Article: Decodable {
    let author: String?
    let title: String?
    let imageURL: String?
    let description: String?
    let publishedAt: Date
    let content: String?
}
