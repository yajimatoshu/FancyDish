//
//  HomeViewModel.swift
//  FancyDish
//
//  Created by SHUTO NISHIYAMA on 2021/01/15.
//

import Foundation
import RxSwift

class HomeViewModel {
    
    private let disposeBag = DisposeBag()
    var model = GourmetModel()
    
    func fetchGourmet(callBack: @escaping (_ result: GourmetResponse) -> Void) {
        model.fetchGourmet().subscribe(onNext: {[weak self] (result) in
            print(result)
            callBack(result)
        }).disposed(by: disposeBag)
    }

}
