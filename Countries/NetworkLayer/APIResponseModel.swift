//
//  APIResponseModel.swift
//  Countries
//
//  Created by Iswariya Madhavan on 04/04/20.
//  Copyright © 2020 Iswariya Madhavan. All rights reserved.
//

import Foundation
import ObjectMapper
import HandyJSON
struct APIResponseModel: HandyJSON {

    var name: String?
    var flag: String?
    var capital: String?
    var region: String?
    var languages: [LanguagesInfo]?
    var currencies: [currencyInfo]?
}

struct LanguagesInfo: HandyJSON {
    var name: String?
    var nativeName: String?
}

struct currencyInfo: HandyJSON {
    var name: String?
    var code: String?
}
