//
//  HomeViewModel.swift
//  FancyDish
//
//  Created by yajima toshu on 2021/01/15.
//

import Foundation
import RxSwift

class HomeViewModel {
    
    private let disposeBag = DisposeBag()
    var model = GourmetModel()
    private (set) var gourmetResults: GourmetResponseResults?
    
    func fetchGourmet(callBack: @escaping (_ result: GourmetResponseResults) -> Void) {
        model.fetchGourmet().subscribe({ [weak self] result in
            guard let wself = self else { return }
            switch result {
            case .success(let response):
                wself.gourmetResults = response.results
                callBack(response.results)
            case .error(_):
                print("error")
            }
        }).disposed(by: disposeBag)
    }
    
    var shopsCount: Int {
        if let results = gourmetResults {
            return results.shop.count
        }
        return .zero
    }

}
