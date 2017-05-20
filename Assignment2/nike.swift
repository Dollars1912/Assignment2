//
//  nike.swift
//  Assignment2
//
//  Created by DANTE HE on 18/05/2017.
//  Copyright © 2017 lawrencechu. All rights reserved.
//

import UIKit

class nike: UITableViewCell {
    @IBOutlet var nikeimage: UIImageView!
    @IBOutlet weak var nikename: UILabel!
    @IBOutlet weak var nikedate: UILabel!
    @IBOutlet weak var nikeprice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
