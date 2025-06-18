//
//  ContentView.swift
//  ClassQuote
//
//  Created by daniel ganem on 17/06/2025.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var quote: Quote = Quote()
    
    var body: some View {
        VStack {
            Image(systemName:"photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(in: .rect)
                .clipShape(Rectangle())
                .overlay {
                    VStack {
                        Text($quote.citation)
                        Text($quote.author)
                    }
                    .multilineTextAlignment(.leading)
                }
            Spacer()
            CustomButton(text: "Get quote",
                         symbol: "arrow.clockwise",
                         color: .blue)
            .onTapGesture {
                quote.getQuote()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
