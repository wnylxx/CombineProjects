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
        NavigationStack{
            List(viewModel.filteredBooks) { book in
                BookListRowView(book: book)
            }
            .searchable(text: $viewModel.searchTerm)
            .textInputAutocapitalization(.none)
//            .refreshable {
//                await viewModel.fetchData()
//            }
//            .overlay {
//                if viewModel.fetching {
//                    ProgressView("Fetching data, please wait...")
//                        .progressViewStyle(CircularProgressViewStyle())
//                }
//            }
        }
    }
}

#Preview {
    BookListView()
}
