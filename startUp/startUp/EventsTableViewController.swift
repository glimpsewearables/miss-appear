//
//  EventsTableViewController.swift
//  startUp
//
//  Created by Alexis Macaskill on 10/16/18.
//  Copyright © 2018 Alexis Macaskill. All rights reserved.
//

import UIKit

struct EventDescription {
    
    var id : Int
    var name : String
    var location : String
    var image : String
    
}

class EventTableViewCell: UITableViewCell {
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventLocationLabel: UILabel!
    @IBOutlet weak var eventImageView: UIImageView!
}

class EventsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    var events = [
        EventDescription(id: 1, name: "Lollapalooza", location: "Grant Park", image: "lolla"),
        EventDescription(id: 2, name: "Bumpershoot", location: "Seattle Center", image: "bumpershoot"),
        EventDescription(id: 3, name: "Coachella", location: "Indio", image: "coachella"),
        ]
    
    // MARK: - Table view data source
   
    // by default the tables have 1 section. This method isn't used right now
    override func numberOfSections(in tableView: UITableView) -> Int {
        return events.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
/*
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    */
    
   /* // Set the spacing between sections
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            
            //extra spacing between tableview and top of page.
            return 60
        }
        return 0
    }
 */
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! EventTableViewCell
    
       // cell.textLabel?.text = events[indexPath.row].name
        let event = events[indexPath.section]
        //let event = events[indexPath.row]
        cell.eventNameLabel?.text = event.name
        //height of rounded image.
        self.tableView.rowHeight = 270;
        self.tableView.separatorColor = UIColor.white;
        cell.eventLocationLabel?.text = event.location
        cell.eventImageView?.image = UIImage(named: event.image)
        //centers the images in the middle of the rectangle and scales to fill
        cell.eventImageView?.contentMode = .scaleAspectFill
        //to make the images rounded.
       //cell.eventImageView?.layer.cornerRadius = 30.0
        cell.layer.backgroundColor = UIColor.white.cgColor
        cell.contentView.backgroundColor = UIColor.white
        
        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
