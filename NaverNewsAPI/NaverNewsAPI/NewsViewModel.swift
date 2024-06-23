//
//  NewsViewModel.swift
//  NaverNewsAPI
//
//  Created by wonyoul heo on 6/23/24.
//

import Foundation
import Combine

class NewsViewModel: ObservableObject {
    @Published var newsItems: [NewsItem] = []
    @Published var searchQuery = ""   
}
