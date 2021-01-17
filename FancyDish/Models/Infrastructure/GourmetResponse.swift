//
//  GourmetResponse.swift
//  FancyDish
//
//  Created by yajima toshu on 2021/01/16.
//

import Foundation

struct GourmetResponse: Codable {
    let results: GourmetResponseResults
    
    struct GourmetResponseResults: Codable {
        let resultsAvailable: Int
        let resultsReturned: String
        let shop: [Shop]
        
        struct Shop: Codable {
            let id: String
            let logoImage: String
            let nameKana: String
            let address: String
            let stationName: String
            let budget: Budget
            
            struct Budget: Codable {
                let average: String
            }
        }
    }
}
