//
//  BookViewModel.swift
//  Combine_BookShelf
//
//  Created by wonyoul heo on 6/22/24.
//

import Foundation
import Combine

private extension String {
    func matches(_ searchTerm: String) -> Bool {
        self.range(of: searchTerm, options: .caseInsensitive) != nil
    }
}

class BookViewModel: ObservableObject {
    
    @Published var books: [Book] = Book.samples
    @Published var fetching = false
    @Published var searchTerm: String = ""
    
    @Published var filteredBooks: [Book] = [Book]()
    
    init() {
        Publishers.CombineLatest($books, $searchTerm)
            .map { books, searchTerm in
                books.filter { book in
                    searchTerm.isEmpty ? true : (book.title.matches(searchTerm) || book.author.matches(searchTerm))
                }
            }
            .assign(to: &$filteredBooks)
    }
}
