//
//  ArticlesService.swift
//  ArticlesTest
//
//  Created by Diachenko Ihor on 30.07.2023.
//

import Combine
import Alamofire

protocol ArticlesUseCase {
    func fetchArticles(fetchParams: FetchArticlesParams) -> AnyPublisher<[Article], Error>
}

final class ArticlesService: ArticlesUseCase {
    
    private enum C {
        static let urlString = "https://newsapi.org/v2/everything?apiKey=\(C.token)"
        static let token = "3ede5880781943078a5ecb5e51a5ddcc"
    }
    
    func fetchArticles(fetchParams: FetchArticlesParams) -> AnyPublisher<[Article], Error> {
        Future<[Article], Error> { promise in
            AF.request(C.urlString,
                       method: .get,
                       parameters: fetchParams.requestParams,
                       encoding: URLEncoding.default)
            .responseDecodable(of: ArticlesData.self) { responseData in
                switch responseData.result {
                case .success(let articlesResponse):
                    let articles = articlesResponse.articles.map { Article(from: $0) }
                    promise(.success(articles))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
