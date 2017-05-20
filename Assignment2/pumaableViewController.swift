//
//  pumaableViewController.swift
//  Assignment2
//
//  Created by DANTE HE on 18/05/2017.
//  Copyright © 2017 lawrencechu. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class pumaTableViewController: UITableViewController
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
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Brandpuma")
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
        sneaker.id = 10
        sneaker.release_date = (formatter.date(from: "2017/03/09") as NSDate?)!
        sneaker.price = 170.0
        sneaker.name = "PUMA Fenty Bow women's Sneaker : PNA"
        sneaker.detail = "Rihanna’s next sneaker with PUMA gets fancy with a built-in bow and smooth silk construction. Continuing to push the boundaries of a traditional sneaker design, Rihanna is sure to have another hit on her hands for the fashion-forward ladies with the Puma Rihanna Bow Sneaker, which drops this Thursday, March 9th in two options of light pink and olive green. As a bonus, there’s a matching slide (sold separately) for each bow-covered sneaker. Like all Rihanna collabs with PUMA, don’t expect these to last long on the shelves. If you’re after a pair, consult our handy list of online retailers below who will have the Fenty Bow Sneaker and Slide in stock this Thursday. "
        sneakerList.append(sneaker)
        
        
        
        sneaker = Sneaker(context: managedObjectContext)
        sneaker.id = 6
        sneaker.release_date = (formatter.date(from: "2017/04/03 ") as NSDate?)!
        sneaker.price = 180.0
        sneaker.name = "Rehanna x Puma Creeper Cracked Leather"
        sneaker.detail = "The Rihanna x Puma Creeper is a popular shoe collaboration between Rihanna and Puma. They are a remixed version on the original Puma Suede. The most noticeable feature of the shoes are the extra thick soles inspired by the creeper silhouette popular during the punk rock era of the ’80s and ‘90s. Read below for further release details and price information. "
        sneakerList.append(sneaker)
        
        
        
        
        sneaker = Sneaker(context: managedObjectContext)
        sneaker.id = 7
        sneaker.release_date = (formatter.date(from: "2017/04/13") as NSDate?)!
        sneaker.price = 200.0
        sneaker.name = "PUMA Fenty Bow women's Sneaker : PNA"
        sneaker.detail = "Rihanna’s latest Puma Fenty sneaker offering is this alternative take on a running shoe from the Trinomic family. No, it doesn’t featured any 4D-printed tech or a midsole 30 years in the making, but it does have a cute and snazzy bow where the shoelaces are meant to be. These are unequivocally a shoe design for the ladies, and this Thursday Sweet Lavender and Pink Tint colorways will hit select retailers such as Rock City Kicks and on Puma.com. Check out the detailed look below and let us know if you like these more than the Puma Creepers."
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "pumatable", for: indexPath) as! puma
        let sneaker: Sneaker = self.sneakerList[indexPath.row] as! Sneaker
        if let sneakerName = sneaker.name {
            cell.pumaname?.text = "\(sneakerName)"
        }
        if let release_date = sneaker.release_date {
            cell.pumadate?.text = "\(release_date)"
        }
        cell.pumaprice?.text = "AUD \(sneaker.price)"
        let imageName = "\(sneaker.id)"
        cell.pumaimage?.image = UIImage(named:"\(imageName)")
        return cell
        
        
}
}
