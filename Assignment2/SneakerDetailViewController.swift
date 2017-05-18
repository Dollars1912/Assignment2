//
//  SneakerDetailViewController.swift
//  Assignment2
//
//  Created by 褚冠宏 on 06/05/2017.
//  Copyright © 2017 lawrencechu. All rights reserved.
//

import UIKit

class SneakerDetailViewController: UIViewController {
    var sneaker: Sneaker?

    @IBOutlet weak var sneakerNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var detail: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (sneaker != nil) {
            sneakerNameLabel.text = sneaker!.name
            priceLabel.text = "price(AUD):$\(sneaker!.price)"
            detail.text = "\(sneaker!.detail)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
