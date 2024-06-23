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
    
    private let newsService = NewsService()
    private var cancellables = Set<AnyCancellable>()
    
    private lazy var searchNewsPublisher: AnyPublisher<NewsResponse, Error> = {
        $searchQuery
            .debounce(for: .seconds(0.3), scheduler: RunLoop.main) // 0.3 초 이내 다중 검색 방지
            .removeDuplicates() // 중복 제거
            .filter { !$0.isEmpty }
            .flatMap { query -> AnyPublisher<NewsResponse, Error> in
                return self.newsService.searchNews(query: query, page: 1, itemsPerPage: 20)}
            .receive(on: DispatchQueue.main)
            .share()
            .eraseToAnyPublisher()
    }()
    
    init() {
        searchNewsPublisher
            .catch { _ in Empty() }
            .sink{ [weak self] response in
                self?.newsItems = response.items // NewsResponse의 items를 받겠다.
            }
            .store(in: &cancellables)
    }
    
}
