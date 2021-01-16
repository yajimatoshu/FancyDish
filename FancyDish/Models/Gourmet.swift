//
//  Gourmet.swift
//  FancyDish
//
//  Created by SHUTO NISHIYAMA on 2021/01/16.
//

import Foundation
import Moya

enum Gourmet {
    case gourmet
}

extension Gourmet: TargetType {
    var baseURL: URL {
        return URL(string: "http://webservice.recruit.co.jp/hotpepper/")!
    }
    
    var path: String {
        switch self {
        case .gourmet:
            return "gourmet/v1/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .gourmet:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .gourmet:
            let param = ["key": PlistManager.gourmetApiKey ?? "",
                         "format": "json",
                         "name": "dinner"]
            return .requestParameters(parameters: param, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
