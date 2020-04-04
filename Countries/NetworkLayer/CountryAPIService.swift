//
//  CountryAPIManager.swift
//  Countries
//
//  Created by Iswariya Madhavan on 04/04/20.
//  Copyright © 2020 Iswariya Madhavan. All rights reserved.
//

import Foundation
class CountryAPIService {
    let provider = CountryMoyaProvider<CountryTarget>()
    init() {}
    func getCountryDetails(region: String, callback: @escaping (_ response: [APIResponseModel]) -> Void) {
        self.provider.request(CountryTarget.getListForRegion(region: region),
                              completion: { response in
                                switch response {
                                case .success(let response):
                                  do {
                                    let dictResult = try JSONSerialization.jsonObject(with: response.data, options: []) as? NSArray
                                    var apiResponse = [APIResponseModel]()
                                    for data in dictResult! {
                                        if let convertedData = data as? NSDictionary {
                                            let result = APIResponseModel.deserialize(from: convertedData)
                                            apiResponse.append(result!)
                                        }
                                    }
                                    callback(apiResponse)
                                  } catch {
                                  }
                                case .failure:
                                    break
                                }
        })
    }
}
