//
//  NB.swift
//  Assignment2
//
//  Created by DANTE HE on 19/05/2017.
//  Copyright © 2017 lawrencechu. All rights reserved.
//

import UIKit

class NB: UITableViewCell {

    @IBOutlet var nbimage: UIImageView!
    @IBOutlet weak var nbname: UILabel!
    @IBOutlet weak var nbdate: UILabel!
    @IBOutlet weak var nbprice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
