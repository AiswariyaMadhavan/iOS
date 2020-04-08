//
//  ViewControllerViewModel.swift
//  Countries
//
//  Created by Iswariya Madhavan on 04/04/20.
//  Copyright © 2020 Iswariya Madhavan. All rights reserved.
//

import Foundation
import UIKit

protocol viewModelDelagte: class {
    func updateSearchData(response: [APIResponseModel])
}

class SearchViewModel: NSObject {
    let countryService = CountryAPIService()
    var allCountries: [APIResponseModel]?
    weak var delegate: viewModelDelagte?
    func getSearchResult(_ searchTerm: String?) {
        print("search term \(searchTerm)")
        countryService.getCountryDetails(region: searchTerm!) { (response) in
            self.delegate?.updateSearchData(response: response)
        }
    }

}
