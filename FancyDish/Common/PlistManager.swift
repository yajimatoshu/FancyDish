//
//  PlistManager.swift
//  FancyDish
//
//  Created by yajima toshu on 2021/01/16.
//

import Foundation

struct PlistManager {
    
    static var keysPath: String? {
        return Bundle.main.path(forResource: "Keys", ofType: "plist")
    }
    
    static var keys: NSDictionary? {
        return NSDictionary(contentsOfFile: keysPath ?? "")
    }
    
    static var gourmetApiKey: String? {
        if let keys = keys {
            return keys["apiKey"] as? String
        }
        return nil
    }

}
