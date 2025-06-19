//
//  ContentView.swift
//  ClassQuote
//
//  Created by daniel ganem on 17/06/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var quoteService = QuoteService()
    
    var body: some View {
        VStack {
            Image(systemName:"photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(in: .rect)
                .clipShape(Rectangle())
                .overlay {
                    VStack(alignment: .leading) {
                        if let quote = quoteService.quote {
                            Text(quote.citation)
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(quote.author)
                                .font(.subheadline)
                                .foregroundColor(.white)
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
