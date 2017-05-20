//
//  vansableViewController.swift
//  Assignment2
//
//  Created by DANTE HE on 18/05/2017.
//  Copyright © 2017 lawrencechu. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class vansTableViewController: UITableViewController
{
    
    var managedObjectContext: NSManagedObjectContext
    var sneakerList:[NSManagedObject] = []
    var sneakerSearchList:[NSManagedObject] = []
    
    required init(coder eDecoder: NSCoder) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        managedObjectContext = (appDelegate?.persistentContainer.viewContext)!
        super.init(coder: eDecoder)!
    }
    override func viewDidLoad() {
        
        // read from db
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Brandvans")
        do {
            let result = try self.managedObjectContext.fetch(fetchRequest)
            sneakerList = result
        }catch {
            let fetchError = error as NSError
            print(fetchError)
        }
        loadFromDatabase()
        
        
    }
    func loadFromDatabase() {
        if (sneakerList.count > 0) {
            return
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        var sneaker = Sneaker(context: managedObjectContext)
        sneaker = Sneaker(context: managedObjectContext)
        sneaker.id = 9
        sneaker.release_date = (formatter.date(from: "2017/05/13 ") as NSDate?)!
        sneaker.price = 200.0
        sneaker.name = "PBlends, Vans, And Peanuts Celebrate 67 Years Of Snoopy & Co.:Bones"
        sneaker.detail = "Southern California’s own BLENDS continues to revamp some of your favorite archival Vans models with their signature ‘Bones’ side panel stripe and premium black leather and now the boutique is back to celebrate the 67th anniversary of Snoopy, Charlie Brown, and the entire Peanuts gang with an upcoming Vans Sk8-Hi Zip slated to release on Saturday, May 13th. The luxurious reissued take on the classic skate silhouette benefits from premium black leather throughout, an updated zipper backing, and an updated ‘Bones’ detail that features Snoopy’s signature lazy contemplative position atop his dog house. Woodstock even gets a subtle feature on the medial side for a nice added touch. Check out more detailed shots below and we’ll let you know where you can grab this pair besides BLENDS later in the week"
        sneakerList.append(sneaker)
        
        
        // save to db
        do {
            try self.managedObjectContext.save()
        } catch let error {
            print("Could not save: \(error)")
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return sneakerList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vanstable", for: indexPath) as! vans
        let sneaker: Sneaker = self.sneakerList[indexPath.row] as! Sneaker
        if let sneakerName = sneaker.name {
            cell.vansname?.text = "\(sneakerName)"
        }
        if let release_date = sneaker.release_date {
            cell.vansdate.text = "\(release_date)"
        }
        cell.vansprice.text = "AUD \(sneaker.price)"
        let imageName = "\(sneaker.id)"
        cell.vansimage?.image = UIImage(named:"\(imageName)")
        return cell
        
        
}
}
