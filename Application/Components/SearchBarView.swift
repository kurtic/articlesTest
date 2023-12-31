//
//  SearchBarView.swift
//  ArticlesTest
//
//  Created by Diachenko Ihor on 30.07.2023.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            
            TextField("Search...", text: $searchText)
                .disableAutocorrection(true)
                
            Image(systemName: "xmark.circle.fill")
            .offset(x: 10)
            .padding(.trailing, 10)
            .foregroundColor(.secondary)
            .opacity(searchText.isEmpty ? 0.0 : 1.0)
            .onTapGesture {
                searchText = ""
            }
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .shadow(color: .secondary.opacity(0.35),
                        radius: 10)
        
        )
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchBarView(searchText: .constant(""))
        }
    }
}
