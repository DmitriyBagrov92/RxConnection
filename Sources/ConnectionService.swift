//
//  ConnectionService.swift
//  BoringSSL-GRPC
//
//  Created by DmitriiBagrov on 20/12/2018.
//

import Foundation
import Alamofire
import RxSwift

public class ConnectionService: ConnectionServiceProtocol {
    
    // MARK: - Output Signals
    
    public let serverConnectionState: Observable<ServerConnectionState>
    
    // MARK: - Private Properties
    
    private let disposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    
    public required init(serverSettings: ServerSettings) throws {
        let initialConnectionState = ServerConnectionState(settings: serverSettings,
                                                           status: .disconnected)
        let _serverConnectionState = Observable.just(initialConnectionState)
        
        if let _reachabilityManager = NetworkReachabilityManager(host: serverSettings.address) {
            self.serverConnectionState = Observable.combineLatest(_serverConnectionState, _reachabilityManager.rx.listen())
                .map( { (state, status) -> ServerConnectionState in
                    return ServerConnectionState(settings: state.settings, status: ServerConnectionStatus.map(status: status))
            })
        } else {
            throw NSError(domain: "Failed to initialize monitoring for host = \(serverSettings.address)", code: 0, userInfo: nil)
        }
    }
    
}
