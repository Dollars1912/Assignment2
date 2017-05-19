//
//  newTableViewController.swift
//  Assignment2
//
//  Created by DANTE HE on 19/05/2017.
//  Copyright © 2017 lawrencechu. All rights reserved.
//

import Foundation
import  UIKit

class sneakernews{
    
    var newssimage: UIImage
    var newsbutton: String
    var newstitle: String
    var newsurls : String
    init(img :UIImage,title: String, button: String,urls:String) {
        self.newstitle = title
        self.newssimage = img
        self.newsbutton = button
        self.newsurls = urls
    }
    
}
class  utilities {
    static var freshnews :[sneakernews] = []
    static func loadnews() -> [sneakernews]{
        freshnews = [
            sneakernews(img :UIImage(named: "1")!,title : "",button : "read  more",urls:"https://www.youtube.com/watch?v=rcVv1N1hReQ"),
            sneakernews(img :UIImage(named: "2")!,title : "",button : "read  more",urls:"https://www.qq.com"),
            sneakernews(img :UIImage(named: "3")!,title : "",button : "read  more",urls:"https://www.qq.com"),
            sneakernews(img :UIImage(named: "4")!,title : "",button : "read  more",urls:"https://www.qq.com"),
            sneakernews(img :UIImage(named: "5")!,title : "",button : "read  more",urls:"https://www.qq.com")
        ]
        return freshnews
    }
}
class newTableViewController: UITableViewController {
    override func viewDidLoad() {
    super.viewDidLoad()
           utilities.loadnews()
    self.tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    
}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}

// MARK: - Table view data source
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
    cell.readmore?.text = "\(utilities.freshnews[indexPath.row].newsbutton)"

 

    return cell
    
    
}



override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    let website = utilities.freshnews[indexPath.row].newsurls
//   performSegue(withIdentifier:"webbrows" , sender:website)
    let urlString = utilities.freshnews[indexPath.row].newsurls
    if let url = URL(string: urlString)
    {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//     if segue.identifier == "webbrows"{
//        (segue.destination as! newsViewController.Sneakernews) = (sender as! sneaker )
//        
//        
//        
}

//
//
//        var valueToPass = utilities.loadnews()
//        var urlToPass = valueToPass[].newsurls
//        if segue.identifier == "" {
//            let destination: newsViewController = segue.destination as! newsViewController
//            if let cell = sender as? UITableViewCell {
//                let indexPath = tableView.indexPath(for: cell)
//                let news:  = sneakerList[indexPath!.row] as! Sneaker
//               
//            }
//        }
//    }


