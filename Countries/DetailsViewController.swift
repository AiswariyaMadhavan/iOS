//
//  DetailsViewController.swift
//  Countries
//
//  Created by Iswariya Madhavan on 04/04/20.
//  Copyright © 2020 Iswariya Madhavan. All rights reserved.
//

import Foundation
import UIKit
class DetailsViewController: UIViewController {
  @IBOutlet weak var lblSelectedCountry: UILabel!
  @IBOutlet weak var lblSelectedLanguage: UILabel!
  @IBOutlet weak var lblSelectedCurrency: UILabel!
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
        var spokenLanguage = " "
        var currency  = " "

        for language in selectedCountry!.languages! {
            spokenLanguage += language.name! + ", "
        }
        lblSelectedLanguage.text = spokenLanguage
        for currencyValue in selectedCountry!.currencies! {
            currency += currencyValue.name! + ", "
        }
        lblSelectedCurrency.text = currency
    }
}
