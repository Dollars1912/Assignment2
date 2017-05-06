//
//  ReleaseTableViewController.swift
//  Assignment2
//
//  Created by 褚冠宏 on 29/04/2017.
//  Copyright © 2017 lawrencechu. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class ReleaseTableViewController: UITableViewController {
    
    var managedObjectContext: NSManagedObjectContext
    var sneakerList:[NSManagedObject] = []
    
    required init(coder eDecoder: NSCoder) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        managedObjectContext = (appDelegate?.persistentContainer.viewContext)!
        super.init(coder: eDecoder)!
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // read from db
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Sneaker")
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
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        var sneaker = Sneaker(context: managedObjectContext)
        sneaker.id = 1
        sneaker.release_date = formatter.date(from: "2016/10/08 22:31") as NSDate?
        sneaker.price = 220.0
        sneaker.name = "nike"
        sneakerList.append(sneaker)
        
        sneaker = Sneaker(context: managedObjectContext)
        sneaker.id = 2
        sneaker.release_date = formatter.date(from: "2016/12/08 22:31") as NSDate?
        sneaker.price = 120.0
        sneaker.name = "puma"
        sneakerList.append(sneaker)
        
        sneaker = Sneaker(context: managedObjectContext)
        sneaker.id = 3
        sneaker.release_date = formatter.date(from: "2016/11/08 22:31") as NSDate?
        sneaker.price = 320.0
        sneaker.name = "adidas"
        sneakerList.append(sneaker)
        // save to db
        do {
            try self.managedObjectContext.save()
        } catch let error {
            print("Could not save: \(error)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sneakerList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReleaseTableCell", for: indexPath)
        let sneaker: Sneaker = self.sneakerList[indexPath.row] as! Sneaker
        cell.textLabel?.text = "\(sneaker.name)"
        cell.detailTextLabel?.text = "\(sneaker.price)"
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSneakerDetail" {
            let destination: SneakerDetailViewController = segue.destination as! SneakerDetailViewController
            if let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPath(for: cell)
                let sneaker: Sneaker = sneakerList[indexPath!.row] as! Sneaker
                destination.sneaker = sneaker
            }
        }
    }

}
