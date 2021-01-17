//
//  JsondecoderEx.swift
//  FancyDish
//
//  Created by yajima toshu on 2021/01/17.
//

import Foundation

// MARK: - JSONDecoder Extension
extension JSONDecoder {
    convenience init(type: JSONDecoder.KeyDecodingStrategy) {
        self.init()
        self.keyDecodingStrategy = type
    }
}
