//
//  GourmetDetailViewModel.swift
//  FancyDish
//
//  Created by yajima toshu on 2021/01/25.
//  


import Foundation

class GourmetDetailViewModel {
    var gourmetDetail: GourmetResponseResults.Shop?
    
    var imageUrl: URL {
        guard let image = gourmetDetail?.photo.pc.l, let imageUrl = URL(string: image) else {
            fatalError()
        }
        return imageUrl
    }
    
    var shopName: String {
        return gourmetDetail?.name ?? "店名がありません"
    }
    
    var address: String {
        return gourmetDetail?.address ?? "住所がありません"
    }
}
