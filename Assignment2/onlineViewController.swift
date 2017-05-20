//
//  newsTableViewController.swift
//  Assignment2
//
//  Created by DANTE HE on 19/05/2017.
//  Copyright © 2017 lawrencechu. All rights reserved.
//

import Foundation
import UIKit



class newsViewController: UIViewController {

    @IBOutlet var webnews: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlpath = NSURL(string:"https://www.fly-kicks.com.au")
        webnews.loadRequest(URLRequest(url: urlpath! as URL ))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
