//
//  BookListRowView.swift
//  Combine_BookShelf
//
//  Created by wonyoul heo on 6/22/24.
//

import SwiftUI

struct BookListRowView: View {
    var book: Book
    var body: some View {
        HStack(alignment: .top) {
            Image(book.mediumCoverImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 90)
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(.headline)
                Text("by \(book.author)")
                    .font(.subheadline)
                Text("\(book.pages) pages")
                    .font(.subheadline)
            }
            Spacer()
        }
    }
}

#Preview {
    BookListRowView(book: Book.samples[0])
}
