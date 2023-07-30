//
//  ArticlesSearchView.swift
//  ArticlesTest
//
//  Created by Diachenko Ihor on 30.07.2023.
//

import SwiftUI

struct ArticlesSearchView: View {
    @State var searchQuery = ""
    
    var body: some View {
        VStack {
            SearchBarView(searchText: $searchQuery)
            List {
                VStack {
                    
                }
            }
        }
        .padding()
    }
}

struct ArticlesSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesSearchView()
    }
}
