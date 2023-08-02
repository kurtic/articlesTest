//
//  ArticlesData.swift
//  ArticlesTest
//
//  Created by Diachenko Ihor on 31.07.2023.
//

import Foundation

struct ArticlesData: Decodable {
    let articles: [Article.Response]
    let totalResults: Int
}
