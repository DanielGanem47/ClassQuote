//
//  Quote.swift
//  ClassQuote
//
//  Created by daniel ganem on 18/06/2025.
//

import Foundation

final class Quote: ObservableObject {
    let service: QuoteService = QuoteService()
    
    @Published var citation: String = ""
    @Published var author: String = ""
    
    func getQuote() {
        service.getQuote()
        citation = service.citation
        author = service.author
    }
}
