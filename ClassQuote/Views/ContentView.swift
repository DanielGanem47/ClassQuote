//
//  ContentView.swift
//  ClassQuote
//
//  Created by daniel ganem on 17/06/2025.
//

import SwiftUI

struct ContentView: View {
    private let urlImage: String = "https://source.unsplash.com/random/1000x1000"
    
    @StateObject private var quoteService = QuoteService()
    
    var body: some View {
        VStack {
            ZStack()
            {
                AsyncImage(url: URL(string: urlImage)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 400)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                        .frame(height: 400)
                        .tint(.accentColor)
                        .clipShape(Rectangle())
                }
                VStack(alignment: .leading) {
                    if let quote = quoteService.quote {
                        Text(quote.citation)
                            .font(.headline)
                            .foregroundColor(.primary)
                        Text(quote.author)
                            .font(.subheadline)
                            .foregroundColor(.primary)
                    }
                }
            }
            Spacer()
            CustomButton(text: "Get quote",
                         symbol: "arrow.clockwise",
                         color: .blue)
            .onTapGesture {
                Task {
                    await quoteService.getQuote()
                }
            }
        }
        .padding()
        .task {
            await quoteService.getQuote()
        }
    }
}

#Preview {
    ContentView()
}
