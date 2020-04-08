//
//  DetailsViewController.swift
//  Countries
//
//  Created by Iswariya Madhavan on 04/04/20.
//  Copyright © 2020 Iswariya Madhavan. All rights reserved.
//

import Foundation
import UIKit
import SVGKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var lblSelectedCountry: UILabel!
    @IBOutlet weak var lblSelectedLanguage: UILabel!
    @IBOutlet weak var lblSelectedCurrency: UILabel!
    @IBOutlet weak var lblSelectedCapital: UILabel!
    @IBOutlet weak var imgSelectedCountry: UIView!
    var selectedCountry: APIResponseModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        setDetails()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    func setDetails(){
        lblSelectedCountry.text = selectedCountry?.name
        setSelectedLanguage()
        setSelectedCurrency()
        setSelectedCapital()
        setSelectedImage()
    }

}

//MARK: Private Functions
extension DetailsViewController {
    private func setSelectedLanguage() {
        var spokenLanguage = " "
        if let selctedLanguage = selectedCountry?.languages {
            for language in selctedLanguage {
                spokenLanguage += language.name! + "  "
            }
            lblSelectedLanguage.text = spokenLanguage
        }
    }

    private func setSelectedCurrency() {
        var currency = " "
        if let selctedCurrency = selectedCountry?.currencies {
            for currencyValue in selctedCurrency {
                currency += currencyValue.name! + "  "
            }
            lblSelectedCurrency.text = currency
        }
    }

    private func setSelectedCapital() {
        if let selctedCapital = selectedCountry?.capital {
            lblSelectedCapital.text = selctedCapital
        }
    }

    private func setSelectedImage() {
        if let selectedFlag = selectedCountry?.flag,
            let flagImage = SVGKImage.init(contentsOf: URL(string: selectedFlag)) {
            let svkImageView = SVGKFastImageView.init(svgkImage: flagImage)
            self.imgSelectedCountry.addSubview(svkImageView!)
            svkImageView?.translatesAutoresizingMaskIntoConstraints = false
            svkImageView?.widthAnchor.constraint(equalTo: self.imgSelectedCountry!.widthAnchor).isActive=true;      svkImageView?.topAnchor.constraint(equalTo: self.imgSelectedCountry!.topAnchor, constant: 20).isActive=true
            svkImageView?.bottomAnchor.constraint(equalTo: self.imgSelectedCountry!.bottomAnchor, constant: 20).isActive=true
        }
    }

}
