//
//  CountryMoyaProvider.swift
//  Countries
//
//  Created by Iswariya Madhavan on 04/04/20.
//  Copyright © 2020 Iswariya Madhavan. All rights reserved.
//

import Foundation
import Moya

final class CountryMoyaProvider<T>: MoyaProvider<T> where T: TargetType {
    override init(endpointClosure: @escaping MoyaProvider<T>.EndpointClosure = MoyaProvider.defaultEndpointMapping,
                  requestClosure: @escaping MoyaProvider<T>.RequestClosure = MoyaProvider<T>.defaultRequestMapping,
                  stubClosure: @escaping MoyaProvider<T>.StubClosure = MoyaProvider.neverStub,
                  callbackQueue: DispatchQueue? = nil,
                  manager: Manager = MoyaProvider<T>.defaultAlamofireManager(),
                  plugins: [PluginType] = [],
                  trackInflights: Bool = false) {
        var appendedPlugins = plugins
        let networkLogEnabled = true
        let networkResponseLogEnabled = true

        if _isDebugAssertConfiguration() && networkLogEnabled {
            appendedPlugins.append(NetworkLoggerPlugin(verbose: networkResponseLogEnabled))
        }

        super.init(endpointClosure: endpointClosure,
                   requestClosure: requestClosure,
                   stubClosure: stubClosure,
                   callbackQueue: callbackQueue,
                   manager: manager,
                   plugins: appendedPlugins,
                   trackInflights: trackInflights)
    }
}
