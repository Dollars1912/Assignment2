//
//  FavoriteTableViewController.swift
//  Assignment2
//
//  Created by 褚冠宏 on 20/05/2017.
//  Copyright © 2017 lawrencechu. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class FavoriteTableViewController: UITableViewController {
    
    var managedObjectContext: NSManagedObjectContext
    var favoriteSneakerList:[NSManagedObject] = []
    var sneakerList:[NSManagedObject] = []
    
    required init(coder eDecoder: NSCoder) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        managedObjectContext = (appDelegate?.persistentContainer.viewContext)!
        super.init(coder: eDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        readFavoriteFromDatabase()
    }
    
    func readFavoriteFromDatabase() {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Favorite")
        do {
            let fec: NSFetchRequest = Sneaker.fetchRequest()
            let sortDescripor = NSSortDescriptor(key:"date",ascending: true)
            fec.sortDescriptors = [sortDescripor]
            let result = try self.managedObjectContext.fetch(fetchRequest)
            favoriteSneakerList = result
            tableView.reloadData()
        }catch {
            let fetchError = error as NSError
            print(fetchError)
        }
    }
    
//    NOTE for test purpose
    func readSneakerFromDatabase() {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Sneaker")
        do {
            let fec: NSFetchRequest = Sneaker.fetchRequest()
            let sortDescripor = NSSortDescriptor(key:"date",ascending: true)
            fec.sortDescriptors = [sortDescripor]
            let result = try self.managedObjectContext.fetch(fetchRequest)
            sneakerList = result
        }catch {
            let fetchError = error as NSError
            print(fetchError)
        }
    }
    
    func insetInitialDataToDatabase() {
        readSneakerFromDatabase();
        if (favoriteSneakerList.count > 0) {
            return
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let favorite = Favorite(context: managedObjectContext)
        favorite.id = 1
        favorite.time = (formatter.date(from: "2017/04/24") as NSDate?)!
        favorite.sneaker = sneakerList[0] as? Sneaker
        favoriteSneakerList.append(favorite)
        // save to db
        do {
            try self.managedObjectContext.save()
        } catch let error {
            print("Could not save: \(error)")
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true;
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteSneakerList.count
    }

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { action, index in
            self.onDeleteButtonClicked(Index: index.row)
        }
        delete.backgroundColor = .red
        return [delete]
    }
    
    func onDeleteButtonClicked(Index index: Int) {
        let favorite = favoriteSneakerList[index]
        favoriteSneakerList.remove(at: index)
        self.managedObjectContext.delete(favorite as NSManagedObject)
        // save to db
        do {
            try self.managedObjectContext.save()
        } catch let error {
            print("Could not save: \(error)")
        }
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteTableCell", for: indexPath)
        let favorite: Favorite = self.favoriteSneakerList[indexPath.row] as! Favorite
        let sneaker = favorite.sneaker!
        if let sneakerName = sneaker.name {
            cell.textLabel?.text = "\(sneakerName)"
        }
        if let release_date = sneaker.release_date {
            cell.detailTextLabel?.text = "\(release_date)"
        }
        
        let imageName = "\(sneaker.id)"
        cell.imageView?.image = UIImage(named:"\(imageName)")
        return cell
    }
}
