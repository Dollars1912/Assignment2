//
//  puma.swift
//  Assignment2
//
//  Created by DANTE HE on 19/05/2017.
//  Copyright © 2017 lawrencechu. All rights reserved.
//

import UIKit

class puma: UITableViewCell {

    
    @IBOutlet var pumaimage: UIImageView!  
    @IBOutlet weak var pumaname: UILabel!
    @IBOutlet weak var pumadate: UILabel!
    @IBOutlet weak var pumaprice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
