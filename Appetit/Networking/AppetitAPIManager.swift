//
//  AppetitAPIManager.swift
//  Appetit
//
//  Created by Sense Infoway on 28/12/16.
//  Copyright © 2016 Douglas Taquary. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import ObjectMapper
import Moya_ObjectMapper

extension Response {
    func removeAPIWrappers() -> Response {
        guard let json = try? self.mapJSON() as? Dictionary<String, AnyObject>,
            let results = json?["data"]?["foods"] ?? [],
            let newData = try? JSONSerialization.data(withJSONObject: results, options: .prettyPrinted) else {
                return self
        }
        
        let newResponse = Response(statusCode: self.statusCode,
                                   data: newData,
                                   response: self.response)
        return newResponse
    }
}

struct AppetitAPIManager {
    
    let provider: RxMoyaProvider<AppetitAPI>
    let disposeBag = DisposeBag()
    
    init() {
        provider = RxMoyaProvider<AppetitAPI>()
    }
}

extension AppetitAPIManager {
    typealias AdditionalStepsAction = (() -> ())
    
    fileprivate func requestObject<T: Mappable>(_ token: AppetitAPI, type: T.Type,
                                   completion: @escaping (T?) -> Void,
                                   additionalSteps: AdditionalStepsAction? = nil) {
        provider.request(token)
            .debug()
            .mapObject(T.self)
            .subscribe { event -> Void in
                switch event {
                case .next(let parsedObject):
                    completion(parsedObject)
                    additionalSteps?()
                case .error(let error):
                    print(error)
                    completion(nil)
                default:
                    break
                }
            }.addDisposableTo(disposeBag)
    }
    
    fileprivate func requestArray<T: Mappable>(_ token: AppetitAPI, type: T.Type,
                                  completion: @escaping ([T]?) -> Void,
                                  additionalSteps:  AdditionalStepsAction? = nil) {
        provider.request(token)
            .debug()
            .map { response -> Response in
                return response.removeAPIWrappers()
            }
            .mapArray(T.self)
            .subscribe { event -> Void in
                switch event {
                case .next(let parsedArray):
                    completion(parsedArray)
                    additionalSteps?()
                case .error(let error):
                    print(error)
                    completion(nil)
                default:
                    break
                }
            }.addDisposableTo(disposeBag)
    }
}

protocol AppetitAPICalls {
    func items(completion: @escaping ([Item]?) -> Void)
}

extension AppetitAPIManager: AppetitAPICalls {

    func items(completion: @escaping ([Item]?) -> Void) {
        requestArray(.items,
                     type: Item.self,
                     completion: completion)
    }
}
