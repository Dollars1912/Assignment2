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

   
//    func loadAdressURL(){
//        let requestURL = NSURL(string:urlpath)
//        let request = NSURLRequest(url: requestURL as! URL)
//        webnews.loadRequest(request as URLRequest)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
       let urlpath = NSURL(string:"https://www.fly-kicks.com.au")
        webnews.loadRequest(URLRequest(url: urlpath! as URL ))
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//
//    // MARK: - Table view data source
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
//        return 1
//    }
//    
//    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "newstable", for: indexPath) as! newscell
//        cell.newsimage.image = utilities.freshnews[indexPath.row].newssimage
//        cell.newstitle?.text = "\(utilities.freshnews[indexPath.row].newstitle)"
//        cell.readmore = indexPath.row
//        cell.readmore(self,action:"browser:",forControlEvents: .TouchUpInside)
//        return cell
//        
//        
//    }
//    
//    
//    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        
//        
//    }
    
    


}