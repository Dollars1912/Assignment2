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

class ReleaseTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var managedObjectContext: NSManagedObjectContext
    var sneakerList:[NSManagedObject] = []
    var sneakerSearchList:[NSManagedObject] = []
    var isSearching = false
    
    required init(coder eDecoder: NSCoder) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        managedObjectContext = (appDelegate?.persistentContainer.viewContext)!
        super.init(coder: eDecoder)!
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isSearching = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            isSearching = false
        } else {
            sneakerSearchList = sneakerList.filter{ value in
                let sneaker = value as! Sneaker
                return sneaker.name.lowercased().contains(searchText.lowercased())
            }
            isSearching = true
        }
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self
        
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
        sneaker.release_date = (formatter.date(from: "2017/04/24 00:00") as NSDate?)!
        sneaker.price = 220.0
        sneaker.name = "NIKE AIR X SUPREME: SUPTEMPO"
        sneaker.detail = "Supreme and \nNike are collaborating for the Air More Uptempo shoe, nicknamed the “Suptempo.”  \nThe Air More Uptempo was originally released in 1996 and is know for the word “AIR” in large letters on the shoe. Supreme's version includes the\n letters “SUP” in place of “AIR.” The shoe releases in three colorways of red/white, black, and metallic gold on April 27th, 2017 ($220), and \nreleases again on April 29th, 2017 ($220) via Nike. "
        sneakerList.append(sneaker)
        
        
        sneaker = Sneaker(context: managedObjectContext)
        sneaker.id = 2
        sneaker.release_date = (formatter.date(from: "2016/12/08 22:31") as NSDate?)!
        sneaker.price = 120.0
        sneaker.name = "NMD XR1 MMJ :Mastermind"
        sneaker.detail = "How can adidas get people even more hyped on the NMD? Add some collaborations into the mix and keep their distribution limited to its top tier of Consortium retailers. That's the plan with this pair, the Mastermind x adidas NMD XR1. The shoe's design doesn't mess with the traditional Mastermind formula, using a no-frills black and white colorway and tossing in the Japanese brand's logos on the support cage.Also on the way from Mastermind is a collab take on the Tubular Instinct, a shoe that's no doubt less anticipated than its NMD."
        sneakerList.append(sneaker)
        
        sneaker = Sneaker(context: managedObjectContext)
        sneaker.id = 3
        sneaker.release_date = (formatter.date(from: "2016/09/20 00:00") as NSDate?)!
        sneaker.price = 500.0
        sneaker.name = "ADIDAS YEEZY BOOST 350 V2 :Zebra"
        sneaker.detail = "More official images are in for the coming Yeezy influx for February 2017.\n While we’re only a week away from the adidas Yeezy Boost 350 V2 Black Red, today we get a detailed look at the coming Yeezy Boost 350 V2 Zebra,\n nicknamed for its unique white and black striped Primeknit upper that contrasts the vibrant red ‘SPLY-350’ side panel branding.The Yeezy V2 Zebra\n is slated to release at global retailers on February 25th, 2017 for $220 USD and marks the second Yeezy Boost release of 2017. The swirling array of\n Primeknit stripes are accented by an updated heel tab, a slip-on upper, and a white side panel stripe while a TPU midsole covers the Boost cushioning\n system throughout."
        sneakerList.append(sneaker)
        
        sneaker = Sneaker(context: managedObjectContext)
        sneaker.id = 4
        sneaker.release_date = (formatter.date(from: "2017/04/08 00:00") as NSDate?)!
        sneaker.price = 139.0
        sneaker.name = "NEW BALANCE MRL420DA "
        sneaker.detail = "New Balance present the MRL420 ‘Premium Re- Engineered’ pack, with three styles that offer a nostalgic nod to classic running shoes from the ‘70s. These sleek sneakers are cut with leather uppers and a REVlite midsole, which provides premium responsiveness and durability at a 30% lighter weight than other foams with comparable performance. They come decorated with perforations and embossed branding throughout."
        sneakerList.append(sneaker)
        
        sneaker = Sneaker(context: managedObjectContext)
        sneaker.id = 5
        sneaker.release_date = (formatter.date(from: "2017/04/04 00:00") as NSDate?)!
        sneaker.price = 180.0
        sneaker.name = "Nike Air Max 97 Silver Bullet"
        sneaker.detail = "The Nike Air Max 97 “Silver Bullet” is finally getting a general release in the US on April 13th, but before we all get a shot at the head-turning classic that was once an Italian staple, Nike Sportswear is dressing up a number of their other Air Max retros with the sought after Metallic Silver/Red combination to help ease the pain of missing out on the AM97. First we saw the Air Max 95 “Silver Bullet” featuring the patent leather look repurposed to fit the overall shape of the iconic AM95 and now another European staple will follow suit with the Nike Air Max Plus. The “Silver Bullet” colorway works rather well on the Air Max Plus given the aggressive side panel overlays and breathable mesh upper. The smaller side panel Swoosh even matches the overall size of the Air Max 97’s. We’re not sure when this women’s exclusive Air Max Plus Silver Bullet will be available, but head over to our Release Dates page for an updated look at all of Nike Sportswear’s latest offerings"
        sneakerList.append(sneaker)
        
        sneaker = Sneaker(context: managedObjectContext)
        sneaker.id = 6
        sneaker.release_date = (formatter.date(from: "2017/04/03 22:31") as NSDate?)!
        
        sneaker.price = 180.0
        sneaker.name = "Rehanna x Puma Creeper Cracked Leather"
        sneaker.detail = "The Rihanna x Puma Creeper is a popular shoe collaboration between Rihanna and Puma. They are a remixed version on the original Puma Suede. The most noticeable feature of the shoes are the extra thick soles inspired by the creeper silhouette popular during the punk rock era of the ’80s and ‘90s. Read below for further release details and price information. "
        sneakerList.append(sneaker)
        
        sneaker = Sneaker(context: managedObjectContext)
        sneaker.id = 7
        sneaker.release_date = (formatter.date(from: "2017/04/13 00:00") as NSDate?)!
        sneaker.price = 200.0
        sneaker.name = "PUMA Fenty Bow women's Sneaker : PNA"
        sneaker.detail = "Rihanna’s latest Puma Fenty sneaker offering is this alternative take on a running shoe from the Trinomic family. No, it doesn’t featured any 4D-printed tech or a midsole 30 years in the making, but it does have a cute and snazzy bow where the shoelaces are meant to be. These are unequivocally a shoe design for the ladies, and this Thursday Sweet Lavender and Pink Tint colorways will hit select retailers such as Rock City Kicks and on Puma.com. Check out the detailed look below and let us know if you like these more than the Puma Creepers."
        sneakerList.append(sneaker)
        
        sneaker = Sneaker(context: managedObjectContext)
        sneaker.id = 8
        sneaker.release_date = (formatter.date(from: "2018/01/01 00:00") as NSDate?)!
        sneaker.price = 230.0
        sneaker.name = "Air Jordan 3:Black Cement"
        sneaker.detail = "It seems like every year we hear a rumor about the Air Jordan 3 “Black Cement” returning with the coveted OG Nike Air branding on the heel in the near future. You can add 2018 to that ongoing tradition as rumors are swirling around the NBA All-Star Weekend playing host to one of the most iconic pairs of the Air Jordan 3 ever. The pair showcased here is a pair that Jordan Brand has used during pop-up displays dating back to 2013 and fits the whole remastered form given the premium black leather, traditional cement Elephant Print and of course, that Nike Air branding on the heel instead of the Jumpman logo that’s replaced the Swoosh in more recent years. It would make sense that the All-Star Weekend festivities would play host to the Jordan 3 Black Cement given the marquee event usually dropping some serious heat. 2018 also marks the 30th anniversary of the legendary creation from Tinker Hatfield. "
        sneakerList.append(sneaker)
        
        sneaker = Sneaker(context: managedObjectContext)
        sneaker.id = 9
        sneaker.release_date = (formatter.date(from: "2017/05/13 00:00") as NSDate?)!
        sneaker.price = 200.0
        sneaker.name = "PBlends, Vans, And Peanuts Celebrate 67 Years Of Snoopy & Co. :Bones"
        sneaker.detail = "Southern California’s own BLENDS continues to revamp some of your favorite archival Vans models with their signature ‘Bones’ side panel stripe and premium black leather and now the boutique is back to celebrate the 67th anniversary of Snoopy, Charlie Brown, and the entire Peanuts gang with an upcoming Vans Sk8-Hi Zip slated to release on Saturday, May 13th. The luxurious reissued take on the classic skate silhouette benefits from premium black leather throughout, an updated zipper backing, and an updated ‘Bones’ detail that features Snoopy’s signature lazy contemplative position atop his dog house. Woodstock even gets a subtle feature on the medial side for a nice added touch. Check out more detailed shots below and we’ll let you know where you can grab this pair besides BLENDS later in the week"
        sneakerList.append(sneaker)
        
        sneaker = Sneaker(context: managedObjectContext)
        sneaker.id = 10
        sneaker.release_date = (formatter.date(from: "2017/03/09 00:00") as NSDate?)!
        sneaker.price = 170.0
        sneaker.name = "PUMA Fenty Bow women's Sneaker : PNA"
        sneaker.detail = "Rihanna’s next sneaker with PUMA gets fancy with a built-in bow and smooth silk construction. Continuing to push the boundaries of a traditional sneaker design, Rihanna is sure to have another hit on her hands for the fashion-forward ladies with the Puma Rihanna Bow Sneaker, which drops this Thursday, March 9th in two options of light pink and olive green. As a bonus, there’s a matching slide (sold separately) for each bow-covered sneaker. Like all Rihanna collabs with PUMA, don’t expect these to last long on the shelves. If you’re after a pair, consult our handy list of online retailers below who will have the Fenty Bow Sneaker and Slide in stock this Thursday. "
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
        if isSearching {
            return sneakerSearchList.count
        } else {
            return sneakerList.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReleaseTableCell", for: indexPath)
        var sneaker: Sneaker = self.sneakerList[indexPath.row] as! Sneaker
        if isSearching {
            sneaker = self.sneakerSearchList[indexPath.row] as! Sneaker
        }
        cell.textLabel?.text = "\(sneaker.name)"
        cell.detailTextLabel?.text = "\(sneaker.price)"
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSneakerDetail" {
            let destination: SneakerDetailViewController = segue.destination as! SneakerDetailViewController
            if let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPath(for: cell)
                var sneaker: Sneaker = sneakerList[indexPath!.row] as! Sneaker
                if isSearching {
                    sneaker = self.sneakerSearchList[indexPath!.row] as! Sneaker
                }
                destination.sneaker = sneaker
            }
        }
    }

}
