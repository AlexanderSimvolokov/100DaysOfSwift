//
//  EmojiRatingView.swift
//  Bookworm 2
//
//  Created by Alexander Simvolokov on 13.08.2026.
//

import SwiftUI

struct EmojiRatingView: View {
    
    let rating: Int

        var body: some View {
            
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)

                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
        }
}

#Preview {
    EmojiRatingView(rating: 3)
}
