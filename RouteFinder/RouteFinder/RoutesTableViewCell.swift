//
//  RoutesTableViewCell.swift
//  RouteFinder
//
//  Created by Bucataru Cristian on 5/17/17.
//  Copyright © 2017 Bucataru Cristian. All rights reserved.
//

import UIKit

class RoutesTableViewCell: UITableViewCell {
    //Mark: Properties
    @IBOutlet weak var detailCell: UILabel!
    @IBOutlet weak var titleCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
