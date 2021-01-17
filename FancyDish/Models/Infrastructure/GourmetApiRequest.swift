//
//  ApiRequest.swift
//  FancyDish
//
//  Created by yajima toshu on 2021/01/16.
//

import Foundation
import Moya
import RxSwift

class GourmetApiRequest {
    
    func request<T: Codable>(config: Gourmet) -> Single<T> {
        return Single.create(subscribe: { [weak self] single in
            let provider = MoyaProvider<Gourmet>()
            let callBack = provider.request(config, completion: { responseResult in
                switch responseResult {
                case let .success(response):
                    do {
                        let decoder = JSONDecoder(type: .convertFromSnakeCase)
                        let data = try decoder.decode(T.self, from: response.data)
                        single(.success(data))
                    } catch let error {
                        single(.error(error))
                    }
                case let .failure(error):
                    single(.error(error))
                }
            })
            return Disposables.create {
                callBack.cancel()
            }
        })
    }
    
}
