//
//  ArticlesSearchView.swift
//  ArticlesTest
//
//  Created by Diachenko Ihor on 30.07.2023.
//

import SwiftUI

struct ArticlesSearchView: View {
    @StateObject var viewModel: ArticlesSearchVM
    
    init(articlesUseCase: ArticlesUseCase) {
        _viewModel = StateObject(wrappedValue: ArticlesSearchVM(articlesUseCase: articlesUseCase))
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                SearchBarView(searchText: $viewModel.searchQuery)
                
                HStack(spacing: 10) {
                    DatePicker(selection: $viewModel.startDate, in: Date().dayStart.oneMonthAgo...viewModel.endDate.yesterday, displayedComponents: .date) {
                        Text("From:")
                    }
                    DatePicker(selection: $viewModel.endDate, in: viewModel.startDate.tommorow...Date.now.dayStart, displayedComponents: .date) {
                        HStack {
                            Spacer()
                            Text("To:")
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                List($viewModel.articles) { article in
                    ZStack {
                        NavigationLink(destination: ArticleDetailView(article: article.wrappedValue)) { EmptyView() }
                        .opacity(0)
                        ArticleView(article: article.wrappedValue)
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    
                }
                .listStyle(.plain)
                .refreshable {
                    viewModel.fetchArticles()
                }
                .overlay(alignment: .center) {
                    if viewModel.articles.isEmpty {
                        Text("No results \n For searching articles, please enter search query")
                            .multilineTextAlignment(.center)   
                    }
                }
            }
            .padding()
            .edgesIgnoringSafeArea(.bottom)
//            .onAppear {
            //                viewModel.fetchArticles()
            //            }
        }
    }
}

struct ArticlesSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesSearchView(articlesUseCase: ArticlesService())
    }
}
