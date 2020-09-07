//
//  MasterTableViewController.swift
//  SplitViewCustomApp
//
//  Created by TriosMac on 2020-08-27.
//  Copyright © 2020 TriosMac. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
    
    var detailVC: DetailViewController? = nil
    let questArray = [["Pre-meeting:",
                    "How big/important is this client?",
                    "Are you prepared? have you done a minimum amount of research?",
                    "Can you really add more to your plate/workload?",
                    "60% coding 40% looking for clients",
                    "Did you have a ballpark figure in your head?",
                    "Be prepared to stick to that figure!"],
                    
                    ["Questions for the client:",
                    "Small-talk, greeting, thank you for the meeting...",
                    "Tell me about your company/business",
                    "Do you currently have a domain name, are you open to the idea of adding a new domain or changing the existing domain",
                    "Who are your customers/clients",
                    "What would your customers say about your product/service",
                    "What makes your product/service stand out from your competitors",
                    "Are you looking to expand into new markets and if so, what markets are you looking at",
                    "do you require an copywriting services?",
                    "Do you have any analytics - Google, Hosting company - visits, client source, country data, browswer data, time on site, bounce rate ~ 30 or less, sales funnel/goal may I have access to the analytics to look for trends?",
                    "How is the site currently hosted? what company and where?",
                    "Have you optimized for SEO, paid for a service, are you interested in SEO marketing services? Search Engine Optimization!",
                    "What methods are you currently using to aquire new clients?",
                    "Is there a technical person I will be dealing with during the completion of the project?",
                    "Do you have products images/materials currently? research",
                    "***What is your sites primary goal? Sales, views, brand awareness? - basically how will I be judged? fresh looking site. web trends",
                    "*Are there any specific problems you would like fixed?",
                    "Are you looking for long-term support/additions or is this project a one off? Do you have the staff to update a site or would a CMS be a better idea?",
                    "Would you like the source files for the project? - flexibility - hire someone else",
                    "*Could you provide 2 or 3 sites that you like are there any designs you would like me to not employ?",
                    "What type of site are you looking for? ecommerce, brah-shure do you need a database?",
                    "***What is your timeline for completion - help set your price",
                    "***What is your budget/discuss your minimum - pothole!!!",
                    "*Are you comfortable with a deposit as well as an agreed upon timeline for the project? 10 - 25% BEFORE work begins! NOT refundable!",
                    "Inform them that a contract will be employed for the project",
                    "Have they met with other developers, if so, what expectation do they have in terms of making a decision on which firm to employ?",
                    "Would you be willing/able to meet again to further discuss any details",
                    "Are there any questions you have at all? perhaps about my experience or my portfolio? if the client has no additional questions you could end with:",
                    "I will take the information and contact you with my assessment",
                    "I will provide you with 2 initial mock-ups",
                    "Once the contract is signed and the deposit paid I will get to work :)",
                    "* encourage them to reach out if they have ANY additional questions/details/concerns or whatever! give them contact details"],
                    
                    ["Post meeting:",
                    "Follow up email ~ next day",
                    "Detailing the meeting points",
                    "Clearly outline cost, timeline and the project details"]]

    let cellID = "customCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let split = splitViewController {
            detailVC = (split.viewControllers.last as!
            UINavigationController).topViewController as?
            DetailViewController
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    
    override func tableView(_ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        return questArray[section].count - 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell {
        // Make sure you define the table view's cell Identifier in the Attributes Inspector pane
        //let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if (cell == nil) {
           cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = questArray[indexPath.section][indexPath.row + 1]
        return cell!
        //cell.textLabel!.text = questArray[indexPath.row]
        //return cell
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return questArray.count
    }

    override func tableView(_ tableView: UITableView,
    titleForHeaderInSection section: Int) -> String? {
        return questArray[section][0]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = questArray[indexPath.section][indexPath.row + 1]
                let controller = (segue.destination as!
                UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0 // Or whatever height you want!
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
            //header.backgroundView?.backgroundColor = UIColor.black
            header.textLabel!.font = UIFont.systemFont(ofSize: 24.0)
            header.textLabel!.font = UIFont.boldSystemFont(ofSize: 24.0)
            //header.textLabel!.textColor = UIColor.orange
            //header.backgroundView?.backgroundColor = UIColor.blue
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
