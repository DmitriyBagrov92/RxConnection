//
//  ConnectionStatus+Extensions.swift
//  RxConnection
//
//  Created by DmitriiBagrov on 14/01/2019.
//

import Foundation
import Alamofire

extension ServerConnectionStatus {
    static func map(status: NetworkReachabilityManager.NetworkReachabilityStatus) -> ServerConnectionStatus {
        switch status {
        case .notReachable, .unknown:
            return .disconnected
        case .reachable(_):
            return .connected
        }
    }
}
