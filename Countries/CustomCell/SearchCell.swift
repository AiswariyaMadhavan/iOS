//
//  SearchCell.swift
//  Countries
//
//  Created by Iswariya Madhavan on 04/04/20.
//  Copyright © 2020 Iswariya Madhavan. All rights reserved.
//

import Foundation
import UIKit
import SVGKit
class SearchCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var countryFlag: UIView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setDataForCell(_ imageURL: URL) {
        if (imageURL.absoluteString == "https://restcountries.eu/data/shn.svg") {
            return
        }
        let flagImage = SVGKImage.init(contentsOf: imageURL)
        let svkImageView = SVGKFastImageView.init(svgkImage: flagImage!)
        self.countryFlag.addSubview(svkImageView!)
        svkImageView?.translatesAutoresizingMaskIntoConstraints = false
        svkImageView?.widthAnchor.constraint(equalTo: self.countryFlag!.widthAnchor).isActive=true;      svkImageView?.topAnchor.constraint(equalTo: self.countryFlag!.topAnchor, constant: 20).isActive=true
        svkImageView?.bottomAnchor.constraint(equalTo: self.countryFlag!.bottomAnchor, constant: 20).isActive=true
    }
}
