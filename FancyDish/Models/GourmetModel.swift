//
//  GourmetModel.swift
//  FancyDish
//
//  Created by yajima toshu on 2021/01/16.
//

import Foundation
import RxSwift


class GourmetModel {
    func fetchGourmet() -> Single<GourmetResponse> {
        return GourmetApiRequest().request(config: Gourmet.gourmet)
    }
    func fetchMiddleArea() -> Single<MiddleAreaResponse> {
        return GourmetApiRequest().request(config: Gourmet.middleArea)
    }
}
