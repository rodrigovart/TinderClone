//
//  QuoteModel.swift
//  Tinder
//
//  Created by G4 tech on 28/02/22.
//

import Foundation

struct QuoteResults: Decodable {
    let results: [Quote]
}

struct Quote: Decodable {
    let content: String
}
