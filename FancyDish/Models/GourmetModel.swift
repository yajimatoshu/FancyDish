//
//  GourmetModel.swift
//  FancyDish
//
//  Created by SHUTO NISHIYAMA on 2021/01/16.
//

import Foundation
import RxSwift


class GourmetModel {
    func fetchGourmet() -> Observable<GourmetResponse> {
        return ApiRequest().request(config: Gourmet.gourmet)
    }
}
