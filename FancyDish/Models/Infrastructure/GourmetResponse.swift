//
//  GourmetResponse.swift
//  FancyDish
//
//  Created by yajima toshu on 2021/01/16.
//

import Foundation

struct GourmetResponse: Codable {
    let results: GourmetResponseResults
}

struct GourmetResponseResults: Codable {
    let resultsAvailable: Int
    let resultsReturned: String
    let shop: [Shop]

    struct Shop: Codable {
        let id: String
        let name: String
        let logoImage: String
        let nameKana: String
        let address: String
        let stationName: String
        let budget: Budget
        let photo: Photo
        
        struct Photo: Codable {
            let pc: Pc
            struct Pc: Codable {
                let l: String
                let m: String
                let s: String
            }
        }
        
        struct Budget: Codable {
            let average: String
        }
    }
}

