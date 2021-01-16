//
//  ApiRequest.swift
//  FancyDish
//
//  Created by SHUTO NISHIYAMA on 2021/01/16.
//

import Foundation
import Moya
import RxSwift

class ApiRequest {
    
    func request(config: Gourmet) -> Observable<GourmetResponse> {
        return Observable.create({[weak self] (observable) -> Disposable in
            let provider = MoyaProvider<Gourmet>()
            let callBack = provider.request(config, completion: { (responseResult) in
                switch responseResult {
                case let .success(response):
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        print(NSString(data: response.data, encoding: String.Encoding.utf8.rawValue))
                        let data = try decoder.decode(GourmetResponse.self, from: response.data)
                        observable.onNext(data)
                    } catch let error {
                        print(error)
                    }
                case let .failure(error):
                    print(error)
                }
            })
            return Disposables.create {
                callBack.cancel()
            }
        })
    }
    
}
