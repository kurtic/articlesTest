//
//  ArticleView.swift
//  ArticlesTest
//
//  Created by Diachenko Ihor on 30.07.2023.
//

import SwiftUI

struct ArticleView: View {
    var article: Article
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(article.title)
                    .font(.title2)
                    .bold()
                    
                Text(article.description)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 5)
                .fill(.white)
                .shadow(color: .secondary.opacity(0.35),
                        radius: 10)
        }
        
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article(author: "",
                                     title: "title",
                                     imageURL: "",
                                     description: "dcdfscdfsc",
                                     publishedAt: Date(),
                                     source: "content"))
    }
}
