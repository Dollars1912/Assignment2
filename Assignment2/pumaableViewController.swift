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
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Brand")
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
        sneaker.id = 1
        sneaker.release_date = (formatter.date(from: "2017/04/24") as NSDate?)!
        sneaker.price = 220.0
        sneaker.name = "NIKE AIR X SUPREME: SUPTEMPO"
        sneaker.detail = "Supreme and \nNike are collaborating for the Air More Uptempo shoe, nicknamed the “Suptempo.”  \nThe Air More Uptempo was originally released in 1996 and is know for the word “AIR” in large letters on the shoe. Supreme's version includes the\n letters “SUP” in place of “AIR.” The shoe releases in three colorways of red/white, black, and metallic gold on April 27th, 2017 ($220), and \nreleases again on April 29th, 2017 ($220) via Nike. "
        sneakerList.append(sneaker)
        
        
        
        
        
        sneaker = Sneaker(context: managedObjectContext)
        sneaker.id = 5
        sneaker.release_date = (formatter.date(from: "2017/04/04") as NSDate?)!
        sneaker.price = 180.0
        sneaker.name = "Nike Air Max 97 Silver Bullet"
        sneaker.detail = "The Nike Air Max 97 “Silver Bullet” is finally getting a general release in the US on April 13th, but before we all get a shot at the head-turning classic that was once an Italian staple, Nike Sportswear is dressing up a number of their other Air Max retros with the sought after Metallic Silver/Red combination to help ease the pain of missing out on the AM97. First we saw the Air Max 95 “Silver Bullet” featuring the patent leather look repurposed to fit the overall shape of the iconic AM95 and now another European staple will follow suit with the Nike Air Max Plus. The “Silver Bullet” colorway works rather well on the Air Max Plus given the aggressive side panel overlays and breathable mesh upper. The smaller side panel Swoosh even matches the overall size of the Air Max 97’s. We’re not sure when this women’s exclusive Air Max Plus Silver Bullet will be available, but head over to our Release Dates page for an updated look at all of Nike Sportswear’s latest offerings"
        sneakerList.append(sneaker)
        
        
        
        
        
        sneaker = Sneaker(context: managedObjectContext)
        sneaker.id = 8
        sneaker.release_date = (formatter.date(from: "2018/01/01") as NSDate?)!
        sneaker.price = 230.0
        sneaker.name = "Air Jordan 3:Black Cement"
        sneaker.detail = "It seems like every year we hear a rumor about the Air Jordan 3 “Black Cement” returning with the coveted OG Nike Air branding on the heel in the near future. You can add 2018 to that ongoing tradition as rumors are swirling around the NBA All-Star Weekend playing host to one of the most iconic pairs of the Air Jordan 3 ever. The pair showcased here is a pair that Jordan Brand has used during pop-up displays dating back to 2013 and fits the whole remastered form given the premium black leather, traditional cement Elephant Print and of course, that Nike Air branding on the heel instead of the Jumpman logo that’s replaced the Swoosh in more recent years. It would make sense that the All-Star Weekend festivities would play host to the Jordan 3 Black Cement given the marquee event usually dropping some serious heat. 2018 also marks the 30th anniversary of the legendary creation from Tinker Hatfield. "
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "niketable", for: indexPath) as! nike
        let sneaker: Sneaker = self.sneakerList[indexPath.row] as! Sneaker
        if let sneakerName = sneaker.name {
            cell.nikename?.text = "\(sneakerName)"
        }
        if let release_date = sneaker.release_date {
            cell.nikedate.text = "\(release_date)"
        }
        cell.nikeprice.text = "AUD \(sneaker.price)"
        let imageName = "\(sneaker.id)"
        cell.nikeimage?.image = UIImage(named:"\(imageName)")
        return cell
        
        
}
