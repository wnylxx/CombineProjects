//
//  ContentView.swift
//  NaverNewsAPI
//
//  Created by wonyoul heo on 6/23/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = NewsViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.newsItems) { item in
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.headline)
                    Text(item.pubDate)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("뉴스 검색 (\(viewModel.newsItems.count) 건)")
            .searchable(text: $viewModel.searchQuery, prompt: "검색어를 입력하세요")
        }
    }
}

#Preview {
    ContentView()
}
