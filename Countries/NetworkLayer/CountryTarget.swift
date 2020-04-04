//
//  CountryTarget.swift
//  Countries
//
//  Created by Iswariya Madhavan on 04/04/20.
//  Copyright © 2020 Iswariya Madhavan. All rights reserved.
//

import Foundation
import Moya
struct CountryTarget: TargetType {
    var baseURL: URL

    var path: String

    var method: Moya.Method 

    var sampleData: Data

    var task: Task

    var headers: [String : String]?

    
}
