//
//  SearchConditionsViewModel.swift
//  FancyDish
//
//  Created by yajima toshu on 2021/01/31.
//  

import RxSwift

enum ConditionsMenu: CaseIterable {
    case keyWoerd
    case area
    case genre
    case other
    
    var title: String {
        switch self {
        case .keyWoerd:
            return "キーワード"
        case .area:
            return "エリア"
        case .genre:
            return "ジャンル"
        case .other:
            return "その他"
        }
    }
}

class SearchConditionsViewModel {
    private let model = GourmetModel()
    private let disposeBag = DisposeBag()
    private (set)var middleAreas: [MiddleArea]?
    private (set)var genres: [Genre]?
    
    func sectionTitle(section: Int) -> String {
        return ConditionsMenu.allCases[section].title
    }
    
    func fetchMiddleArea(callBack: @escaping (_ result: MiddleAreaResponseResults) -> Void) {
        model.fetchMiddleArea().subscribe({ [weak self] result in
            guard let wself = self else { return }
            switch result {
            case .success(let response):
                wself.middleAreas = response.results.middleArea
                callBack(response.results)
            case .error(_):
                print("error")
            }
        }).disposed(by: disposeBag)
    }
    
    func fetchGenre(callBack: @escaping (_ result: GenreResponseResults) -> Void) {
        model.fetchGenre().subscribe({ [weak self] result in
            guard let wself = self else { return }
            switch result {
            case .success(let response):
                wself.genres = response.results.genre
                callBack(response.results)
            case .error(_):
                print("error")
            }
        }).disposed(by: disposeBag)
    }
    
}
