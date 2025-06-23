//
//  QuoteService.swift
//  ClassQuote
//
//  Created by daniel ganem on 17/06/2025.
//

import Foundation

final class QuoteService: ObservableObject {
    private let url: String = "http://api.forismatic.com/api/1.0/?method=getQuote&format=json&lang=en"
    
    @Published var quote: Quote?
    
    func getQuote() async {
        guard let url = URL(string: url) else {
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(Quote.self, from: data)
            quote = decoded
        } catch {
            print("Erreur de chargement : \(error)")
        }
    }
}
