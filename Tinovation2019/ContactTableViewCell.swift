//
//  ContactTableViewCell.swift
//  Tinovation2019
//
//  Created by Ashwin Rajesh on 12/10/19.
//  Copyright © 2019 Ashwin Rajesh. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var contactName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
