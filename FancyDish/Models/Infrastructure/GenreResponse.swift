//
//  GenreResponse.swift
//  FancyDish
//
//  Created by yajima toshu on 2021/03/02.
//

import Foundation

struct GenreResponse: Codable {
    let results: GenreResponseResults
}

struct GenreResponseResults: Codable {
    let resultsAvailable: Int?
    let resultsReturned: String?
    let genre: [Genre]
}

struct Genre: Codable {
    let code: String
    let name: String
}
