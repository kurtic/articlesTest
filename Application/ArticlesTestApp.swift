//
//  ArticlesTestApp.swift
//  ArticlesTest
//
//  Created by Diachenko Ihor on 30.07.2023.
//

import SwiftUI

@main
struct ArticlesTestApp: App {
    var body: some Scene {
        WindowGroup {
            ArticlesSearchView(articlesUseCase: ArticlesService())
        }
    }
}
