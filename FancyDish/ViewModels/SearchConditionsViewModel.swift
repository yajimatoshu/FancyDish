//
//  SearchConditionsViewModel.swift
//  FancyDish
//
//  Created by yajima toshu on 2021/01/31.
//  

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
    
    func sectionTitle(section: Int) -> String {
        return ConditionsMenu.allCases[section].title
    }
    
}
