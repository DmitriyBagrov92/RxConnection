//
//  ConnectionServiceProtocol.swift
//  RxConnection
//
//  Created by DmitriiBagrov on 14/01/2019.
//

import Foundation
import Alamofire
import RxSwift

public protocol ConnectionServiceProtocol {
    /// Observable to connection state. Dynamic.
    var serverConnectionState: Observable<ServerConnectionState> { get }

    /// You can init 1 instance of service to monitor 1 server.
    /// If you need to multy server monitoring you can easily create several instance of this service for it.
    ///
    /// - Parameter serverSettings: Describes server address and secure (https/tls) setup of it (In future).
    /// - Throws: Can throw exception if server address can't be resolved
    init(serverSettings: ServerSettings) throws
}

/// Connection State store settings and status for simple determination
public struct ServerConnectionState {
    let settings: ServerSettings
    let status: ServerConnectionStatus
    
    init(settings: ServerSettings, status: ServerConnectionStatus) {
        self.settings = settings
        self.status = status
    }
}

/// Connection status
public enum ServerConnectionStatus {
    case disconnected
    case connected
    case connectionFailed(error: Error)
}

/// Server Settings
public struct ServerSettings {
    let address: String
    
    init(address: String) {
        self.address = address
    }
}
