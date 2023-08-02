//
//  ArticlesSearchVM.swift
//  ArticlesTest
//
//  Created by Diachenko Ihor on 30.07.2023.
//

import Combine
import Foundation


final class ArticlesSearchVM: ObservableObject {
    
    // MARK: - Published Properties
    @Published var searchQuery: String = ""
    @Published var articles: [Article] = []
    @Published var startDate = Date().dayStart.oneMonthAgo
    @Published var endDate = Date().dayStart
    
    // MARK: - Properties
    let articlesUseCase: ArticlesUseCase
    var cancellableTasks = Set<AnyCancellable>()
    
    // MARK: - Life Cycle
    init(articlesUseCase: ArticlesUseCase) {
        self.articlesUseCase = articlesUseCase
        binding()
    }
    
    private func binding() {
        $searchQuery.debounce(for: 0.7, scheduler: RunLoop.main)
            .dropFirst()
            .combineLatest($startDate, $endDate)
            .flatMap { [unowned self] query, startDate, endDate in
                articlesUseCase.fetchArticles(fetchParams: FetchArticlesParams(query: query,
                                                                               startDate: startDate,
                                                                               endDate: endDate))
                .replaceError(with: [])
            }
            .sink { [unowned self] articles in
                self.articles = articles
            }
            .store(in: &cancellableTasks)
    }
    
    func fetchArticles() {
        articlesUseCase.fetchArticles(fetchParams: FetchArticlesParams(query: searchQuery,
                                                                       startDate: startDate,
                                                                       endDate: endDate))
        .replaceError(with: [])
        .sink { [unowned self] articles in
            self.articles = articles
        }
        .store(in: &cancellableTasks)
    }
}
