//
//  adidas.swift
//  Assignment2
//
//  Created by DANTE HE on 19/05/2017.
//  Copyright © 2017 lawrencechu. All rights reserved.
//

import UIKit

class adidas: UITableViewCell {

    @IBOutlet var adidasimage: UIImageView!
    @IBOutlet weak var adidasname: UILabel!
    @IBOutlet weak var adidasdate: UILabel!
    @IBOutlet weak var adidasprice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
