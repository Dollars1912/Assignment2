//
//  newscell.swift
//  Assignment2
//
//  Created by DANTE HE on 19/05/2017.
//  Copyright © 2017 lawrencechu. All rights reserved.
//

import UIKit

class newscell: UITableViewCell {

    
    
    @IBOutlet var newsimage: UIImageView!
    @IBOutlet weak var newstitle: UILabel!
    @IBOutlet weak var readmore: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
