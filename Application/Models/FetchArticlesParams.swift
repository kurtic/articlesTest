//
//  FetchArticlesParams.swift
//  ArticlesTest
//
//  Created by Diachenko Ihor on 31.07.2023.
//

import Foundation

struct FetchArticlesParams {
    let query: String
    let startDate: Date
    let endDate: Date
    
    var requestParams: [String: Any] {
        var params = [String: Any]()
        if !query.isEmpty {
            params.updateValue(query, forKey: "q")
        }

        params.updateValue(startDate, forKey: "from")
        params.updateValue(endDate, forKey: "to")
        return params
    }
}
