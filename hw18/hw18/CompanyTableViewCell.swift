//
//  CompanyTableViewCell.swift
//  hw18
//
//  Created by Елизавета Метла on 9/28/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//

import UIKit

class CompanyTableViewCell: UITableViewCell {

    public func update(with company: Company) {
        textLabel?.text = "\(company.nameOfCompany ?? "")"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
