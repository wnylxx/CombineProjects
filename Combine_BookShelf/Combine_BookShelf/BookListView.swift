//
//  ContentView.swift
//  Combine_BookShelf
//
//  Created by wonyoul heo on 6/22/24.
//

import SwiftUI

struct BookListView: View {
    @StateObject var viewModel = BookViewModel()
    
    var body: some View {
        List(viewModel.books) { book in
            BookListRowView(book: book)
        }
    }
}

#Preview {
    BookListView()
}
