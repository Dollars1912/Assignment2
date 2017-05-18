//
//  newTableViewController.swift
//  Assignment2
//
//  Created by DANTE HE on 19/05/2017.
//  Copyright © 2017 lawrencechu. All rights reserved.
//

import Foundation
import UIKit

class sneakernews{
  
    var newssimage: UIImage
    var newsbutton: String
    var newstitle: String
    init(img :UIImage,title: String, button: String) {
        self.newstitle = title
        self.newssimage = img
        self.newsbutton = button
    }
    
}
class  utilities {
    static var freshnews :[sneakernews] = []
    static func loadnews(){
        freshnews = [
sneakernews(img :UIImage(named: "1")!,title : "",button : "read  more"),
sneakernews(img :UIImage(named: "2")!,title : "",button : "read  more"),
sneakernews(img :UIImage(named: "3")!,title : "",button : "read  more"),
sneakernews(img :UIImage(named: "4")!,title : "",button : "read  more"),
sneakernews(img :UIImage(named: "5")!,title : "",button : "read  more")
            ]
    }
}



class newTableViewController: UITableViewController
{
    
    override func viewDidLoad() {
        utilities.loadnews()
        self.tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "newstable", for: indexPath) as! newscell
        cell.newsimage.image = utilities.freshnews[indexPath.row].newssimage
        cell.newstitle?.text = "\(utilities.freshnews[indexPath.row].newstitle)"
//        cell.readmore.tag = indexPath.row
//        cell.readmore.addTarget(self,action:"brows:",forControlEvents: .TouchUpInside)
        return cell

        
    }
 
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

        
    }
 

    
    
    
    
    
}
