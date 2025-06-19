//
//  QuoteService.swift
//  ClassQuote
//
//  Created by daniel ganem on 17/06/2025.
//

import Foundation

final class QuoteService {
    private let baseURL: URL = URL.init(filePath: "http://api.forismatic.com/api/1.0/")!
    
    @Published var quote: Quote = Quote()
    
    func getQuote() async {
        var request: URLRequest = URLRequest(url: baseURL)
        request.httpMethod = "POST"
        
        let body: String = "method=getQuote&format=json&lang=en"
        request.httpBody = body.data(using: .utf8)
        
        let session: URLSession = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return
            }
            let decode: JSONDecoder = JSONDecoder()
            guard let responseJSON = try? decode.decode(quote.self, from: data),
                    let text = responseJSON["quoteText"],
                    let auth = responseJSON["quoteAuthor"] else {
                return
            }
            self.citation = text
            self.author = auth
        }
        task.resume()
    }
}
