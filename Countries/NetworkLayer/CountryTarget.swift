//
//  CountryTarget.swift
//  Countries
//
//  Created by Iswariya Madhavan on 04/04/20.
//  Copyright © 2020 Iswariya Madhavan. All rights reserved.
//

import Foundation
import Moya
enum CountryTarget {
    case getListForRegion(region: String)
}
extension CountryTarget: TargetType {
    var baseURL: URL {
        return URL(string: "https://restcountries.eu/rest/")!
    }

    var path: String {
        switch self {
        case .getListForRegion(let regionCode):
            return "v2/name/" + regionCode
        }
    }

    var method: Moya.Method {
        return .get
    }

    var sampleData: Data {
        Data()
    }

    var task: Task {
        return .requestPlain
    }

    var headers: [String : String]? {
        return nil
    }

}
