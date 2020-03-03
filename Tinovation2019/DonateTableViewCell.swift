//
//  DonateTableViewCell.swift
//  Tinovation2019
//
//  Created by Ashwin Rajesh on 3/2/20.
//  Copyright © 2020 Ashwin Rajesh. All rights reserved.
//

import UIKit

class DonateTableViewCell: UITableViewCell {

    @IBOutlet weak var schoolLabel: UILabel!
    @IBOutlet weak var donationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
