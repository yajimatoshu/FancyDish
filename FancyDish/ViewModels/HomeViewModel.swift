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
    
    func fetchGourmet(callBack: @escaping (_ result: GourmetResponse.GourmetResponseResults) -> Void) {
        model.fetchGourmet().subscribe({ [weak self] result in
            switch result {
            case .success(let response):
                print(response.results)
                callBack(response.results)
            case .error(_):
                print("error")
            }
        }).disposed(by: disposeBag)
    }

}
