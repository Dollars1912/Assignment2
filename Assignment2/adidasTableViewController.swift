//
//  adidasTableViewController.swift
//  Assignment2
//
//  Created by DANTE HE on 18/05/2017.
//  Copyright © 2017 lawrencechu. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class adidasTableViewController: UITableViewController
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
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Brandadidas")
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
        sneaker.id = 2
        sneaker.release_date = (formatter.date(from: "2016/12/08") as NSDate?)!
        sneaker.price = 120.0
        sneaker.name = "NMD XR1 MMJ :Mastermind"
        sneaker.detail = "How can adidas get people even more hyped on the NMD? Add some collaborations into the mix and keep their distribution limited to its top tier of Consortium retailers. That's the plan with this pair, the Mastermind x adidas NMD XR1. The shoe's design doesn't mess with the traditional Mastermind formula, using a no-frills black and white colorway and tossing in the Japanese brand's logos on the support cage.Also on the way from Mastermind is a collab take on the Tubular Instinct, a shoe that's no doubt less anticipated than its NMD."
        sneakerList.append(sneaker)
        
        sneaker = Sneaker(context: managedObjectContext)
        sneaker.id = 3
        sneaker.release_date = (formatter.date(from: "2016/09/20") as NSDate?)!
        sneaker.price = 500.0
        sneaker.name = "ADIDAS YEEZY BOOST 350 V2 :Zebra"
        sneaker.detail = "More official images are in for the coming Yeezy influx for February 2017.\n While we’re only a week away from the adidas Yeezy Boost 350 V2 Black Red, today we get a detailed look at the coming Yeezy Boost 350 V2 Zebra,\n nicknamed for its unique white and black striped Primeknit upper that contrasts the vibrant red ‘SPLY-350’ side panel branding.The Yeezy V2 Zebra\n is slated to release at global retailers on February 25th, 2017 for $220 USD and marks the second Yeezy Boost release of 2017. The swirling array of\n Primeknit stripes are accented by an updated heel tab, a slip-on upper, and a white side panel stripe while a TPU midsole covers the Boost cushioning\n system throughout."
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "adidastable", for: indexPath) as! adidas
        let sneaker: Sneaker = self.sneakerList[indexPath.row] as! Sneaker
        if let sneakerName = sneaker.name {
            cell.adidasname?.text = "\(sneakerName)"
        }
        if let release_date = sneaker.release_date {
            cell.adidasdate.text = "\(release_date)"
        }
        cell.adidasprice.text = "AUD \(sneaker.price)"
        let imageName = "\(sneaker.id)"
        cell.adidasimage?.image = UIImage(named:"\(imageName)")
        return cell
    }
}
