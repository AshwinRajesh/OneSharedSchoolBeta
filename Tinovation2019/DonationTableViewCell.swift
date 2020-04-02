//
//  DonationTableViewCell.swift
//  Tinovation2019
//
//  Created by Ashwin Rajesh on 3/31/20.
//  Copyright © 2020 Ashwin Rajesh. All rights reserved.
//

import UIKit

class DonationTableViewCell: UITableViewCell {

    @IBOutlet weak var donationAmount: UILabel!
    @IBOutlet weak var donationTitle: UILabel!
    @IBOutlet weak var donationSchool: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
