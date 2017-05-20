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
    @IBOutlet var sneakerimage: UIImageView!
    @IBOutlet weak var sneakerNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var detail: UITextView!
    @IBOutlet weak var pageslider: UIPageControl!
    var timer :Timer!
    var counter :Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(SneakerDetailViewController.updateTimer), userInfo: nil, repeats: true)
        counter = 0
        if (sneaker != nil) {
            sneakerNameLabel.text = sneaker!.name
            priceLabel.text = "price(AUD):$\(sneaker!.price)"
            detail.text = "\(sneaker!.detail)"
        }
    }
    
    internal func updateTimer()
    {
        if(counter == 0)
        {
        pageslider.currentPage = counter
            sneakerimage.image = UIImage(named:"\(sneaker!.id)")
            counter = counter + 1
        }
        else if(counter == 1)
        {
            pageslider.currentPage = counter
            sneakerimage.image = UIImage(named:"\(sneaker!.id) - \(sneaker!.id)")
            counter = counter + 1
        }
        else if(counter == 2)
        {
            pageslider.currentPage = counter
            sneakerimage.image = UIImage(named:"\(sneaker!.id) - \(sneaker!.id) - \(sneaker!.id)")
            counter = counter + 1
        }
        else
        {
            counter = 0
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
