//
//  ViewControllerViewModel.swift
//  Countries
//
//  Created by Iswariya Madhavan on 04/04/20.
//  Copyright © 2020 Iswariya Madhavan. All rights reserved.
//

import Foundation
import UIKit
import PocketSVG

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

    func loadImage(flagURL: String) -> SVGImageView?  {
         return SVGImageView.init(contentsOf: URL.init(string: flagURL)!)

//        let svgImageView = SVGImageView.init(contentsOf: URL.init(string: flagURL)!)
//        svgImageView.frame = view.bounds
//        svgImageView.contentMode = .scaleAspectFit
//        view.addSubview(svgImageView)
    }

}
