//
//  newbalanceableViewController.swift
//  Assignment2
//
//  Created by DANTE HE on 18/05/2017.
//  Copyright © 2017 lawrencechu. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class newbalanceTableViewController: UITableViewController
{
    
    var managedObjectContext: NSManagedObjectContext
    var sneakerList:[NSManagedObject] = []
    var sneakerSearchList:[NSManagedObject] = []
    //    var imgs = [UIImage(named:"")]
    required init(coder eDecoder: NSCoder) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        managedObjectContext = (appDelegate?.persistentContainer.viewContext)!
        super.init(coder: eDecoder)!
    }
    override func viewDidLoad() {
        
        // read from db
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Brandnb")
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
        sneaker.id = 4
        sneaker.release_date = (formatter.date(from: "2017/04/08") as NSDate?)!
        sneaker.price = 139.0
        sneaker.name = "NEW BALANCE MRL420DA "
        sneaker.detail = "New Balance present the MRL420 ‘Premium Re- Engineered’ pack, with three styles that offer a nostalgic nod to classic running shoes from the ‘70s. These sleek sneakers are cut with leather uppers and a REVlite midsole, which provides premium responsiveness and durability at a 30% lighter weight than other foams with comparable performance. They come decorated with perforations and embossed branding throughout."
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "nbtable", for: indexPath) as! NB
        let sneaker: Sneaker = self.sneakerList[indexPath.row] as! Sneaker
        if let sneakerName = sneaker.name {
            cell.nbname?.text = "\(sneakerName)"
        }
        if let release_date = sneaker.release_date {
            cell.nbdate.text = "\(release_date)"
        }
        cell.nbprice.text = "AUD \(sneaker.price)"
        let imageName = "\(sneaker.id)"
        cell.nbimage?.image = UIImage(named:"\(imageName)")
        return cell
        
        
}
}
