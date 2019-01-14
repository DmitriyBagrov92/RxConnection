//
//  Rx+Alamofire.swift
//  Alamofire
//
//  Created by DmitriiBagrov on 20/12/2018.
//

import Alamofire
import Foundation
import RxSwift

extension NetworkReachabilityManager: ReactiveCompatible { }

public extension Reactive where Base: NetworkReachabilityManager {
    
    func listen() -> Observable<NetworkReachabilityManager.NetworkReachabilityStatus> {
        return Observable.create { observer in
            let listener = { (status: NetworkReachabilityManager.NetworkReachabilityStatus) in
                observer.onNext(status)
            }
            self.base.listener = listener
            if self.base.startListening() {
                //TODO: Is it neccessary to notify about successful start on listening?
            } else {
                observer.onError(NSError(domain: "Failed to start listen host", code: 0, userInfo: nil))
            }
            return Disposables.create()
        }
    }
    
}
