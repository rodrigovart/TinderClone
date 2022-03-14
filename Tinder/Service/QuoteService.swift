//
//  QuoteService.swift
//  Tinder
//
//  Created by G4 tech on 28/02/22.
//

import Foundation
import Alamofire

class QuoteService {
    
    static let shared =  QuoteService()
    
    func searchQuotes(completion: @escaping ([Quote]) -> Void) {
        AF.request("https://quotable.io/quotes?page=1&tags=technology").responseDecodable(of: QuoteResults.self) { response in
            guard let randomQuotes = response.value else { return }
            completion(randomQuotes.results)
        }
    }
}
