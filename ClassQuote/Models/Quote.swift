//
//  Quote.swift
//  ClassQuote
//
//  Created by daniel ganem on 18/06/2025.
//

import Foundation

struct Quote: Codable {
    let citation: String
    let author: String

    enum CodingKeys: String, CodingKey {
        case citation = "quoteText"
        case author = "quoteAuthor"
    }
}
