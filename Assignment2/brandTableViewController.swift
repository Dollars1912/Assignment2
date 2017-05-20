//
//  brandTableViewController.swift
//  Assignment2
//
//  Created by DANTE HE on 18/05/2017.
//  Copyright © 2017 lawrencechu. All rights reserved.
//

import Foundation
import  UIKit

class  brandTableViewController: UITableViewController {
    
    var names = [String]()
    var identities = [String]()
    
    override func viewDidLoad() {
        names = ["Nike", "Puma","NewBalance","Adidas","Vans"]
        identities = ["jordan","fenty","NB","NMD","BONE"]
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "brandname")
        cell?.textLabel!.text = names[indexPath.row]
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcname = identities[indexPath.row]
        let viewController = storyboard?.instantiateViewController(withIdentifier: vcname)
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
}
