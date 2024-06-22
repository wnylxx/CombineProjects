//
//  BookViewModel.swift
//  Combine_BookShelf
//
//  Created by wonyoul heo on 6/22/24.
//

import Foundation
import Combine

class BookViewModel: ObservableObject {
    
    @Published var books: [Book] = Book.samples
    @Published var fetching = false
    @Published var searchTerm: String = ""
    
    @Published var filteredBooks: [Book] = [Book]()
    
    
}
