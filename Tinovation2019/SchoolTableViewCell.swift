//
//  SchoolTableViewCell.swift
//  Tinovation2019
//
//  Created by Ashwin Rajesh on 3/4/20.
//  Copyright © 2020 Ashwin Rajesh. All rights reserved.
//

import UIKit

class SchoolTableViewCell: UITableViewCell {

    @IBOutlet weak var schoolLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
