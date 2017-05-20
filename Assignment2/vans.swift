//
//  vans.swift
//  Assignment2
//
//  Created by DANTE HE on 19/05/2017.
//  Copyright © 2017 lawrencechu. All rights reserved.
//

import UIKit

class vans: UITableViewCell {


    @IBOutlet var vansimage: UIImageView!
    @IBOutlet weak var vansname: UILabel!
    @IBOutlet weak var vansdate: UILabel!
    @IBOutlet weak var vansprice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
