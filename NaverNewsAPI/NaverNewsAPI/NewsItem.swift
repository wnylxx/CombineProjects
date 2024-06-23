//
//  NewsItem.swift
//  NaverNewsAPI
//
//  Created by wonyoul heo on 6/23/24.
//

import Foundation


// NaverNews API로 받아오는 구조
struct NewsResponse: Codable {
    let total: Int
    let items: [NewsItem]
}



struct NewsItem: Codable, Identifiable {
    // 디코딩을 위한 Identifiable, list에 올리기 위한 Codable
    let id = UUID()
    let title: String
    let link: String
    let originallink: String
    let description: String
    let pubDate: String
    
    
    // UUID는 API로 받아오는 값이 아니기 때문에 CodingKey를 설정해주어야 한다.
    enum CodingKeys: String, CodingKey {
        case title, link, originallink, description, pubDate
    }
}
