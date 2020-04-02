//
//  SuggestionTableViewCell.swift
//  Tinovation2019
//
//  Created by Ashwin Rajesh on 4/1/20.
//  Copyright © 2020 Ashwin Rajesh. All rights reserved.
//

import UIKit

class SuggestionTableViewCell: UITableViewCell {

    @IBOutlet weak var suggestionName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
