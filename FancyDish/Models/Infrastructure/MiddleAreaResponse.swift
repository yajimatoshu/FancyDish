//
//  MiddleAreaResponse.swift
//  FancyDish
//
//  Created by yajima toshu on 2021/02/06.
//  


import Foundation

struct MiddleAreaResponse: Codable {
    let results: MiddleAreaResponseResults
}

struct MiddleAreaResponseResults: Codable {
    let resultsAvailable: Int?
    let resultsReturned: String?
    let middleArea: [MiddleArea]
}

struct MiddleArea: Codable {
    let code: String
    let name: String
}
