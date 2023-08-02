//
//  ArticleDetailView.swift
//  ArticlesTest
//
//  Created by Diachenko Ihor on 31.07.2023.
//

import SwiftUI
import NukeUI

struct ArticleDetailView: View {
    @State var article: Article
    
    static let taskDateFormat: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
    }()
    
    var body: some View {
        VStack(spacing: 10) {
            LazyImage(source: URL(string: article.imageURL))
                .frame(width: 200, height: 200)
                .cornerRadius(100)
            Group {
                Text(article.title)
                    .font(.title)
                    
                Text(article.author)
                Text(article.description)
            }
            .multilineTextAlignment(.center)
            HStack {
                Text("Source: \(article.source)")
                Spacer()
                Text(DateFormatter.shortDateFormat.string(from: article.publishedAt))
            }
            .foregroundColor(.secondary)
        }
        .padding()
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(article: Article(author: "Max G. Levy",
                                           title: "Coming Soon Near You: Bears",
                                           imageURL: "https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/c3be8027600a57f72bc8352f391747a0.jpg",
                                           description: "Extreme heat and other weather events are driving bears closer to humans’ campgrounds and hiking trails—and that’s no good for either species",
                                           publishedAt: Date(),
                                           source: "Lifehacker.com"))
    }
}
