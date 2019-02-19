//
//  EventsTableViewController.swift
//  startUp
//
//  Created by Alexis Macaskill on 10/16/18.
//  Copyright © 2018 Alexis Macaskill. All rights reserved.
//

import UIKit
import Foundation

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
        navigationItem.title = "Events"
        fetchMedia()
        tableView.backgroundColor = UIColor.white
        //tableView.register(EventCell.self, forCellReuseIdentifier: "cellId")

    }
    var events = [Event]() //array of media data
    var meta = [Meta]() //meta data
    /*
    var events = [
        EventDescription(id: 1, name: "Lollapalooza", location: "August 1st-3rd", image: "lolla"),
        EventDescription(id: 2, name: "Bumpershoot", location: "Sept 1st-3rd", image: "bumpershoot"),
        EventDescription(id: 3, name: "Coachella", location: "May 24-27th", image: "coachella"),
        ]
    */
    // MARK: - Table view data source
   
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
        
       // let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellID")
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! EventTableViewCell
    
        let event = events[indexPath.section]
        //let event = events[indexPath.row]
        cell.eventNameLabel?.text = event.name
        //height of rounded image.
        self.tableView.rowHeight = 270;
        self.tableView.separatorColor = UIColor.white;
        cell.eventLocationLabel?.text = event.address
        
        let url = URL(string: event.headerImage!)
        let data = try? Data(contentsOf: url!)
        
        if let imageData = data {
            let image = UIImage(data: imageData)
            cell.eventImageView?.image = image
        }
        
        //centers the images in the middle of the rectangle and scales to fill
        cell.eventImageView?.contentMode = .scaleAspectFill
        //to make the images rounded.
       //cell.eventImageView?.layer.cornerRadius = 30.0
        cell.layer.backgroundColor = UIColor.white.cgColor
        cell.contentView.backgroundColor = UIColor.white
        
        return cell
    }
    
 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the index path from the cell that was tapped
        let indexPath = tableView.indexPathForSelectedRow
        
        // Get the new view controller using segue.destination.
        
        if segue.destination is individualTableViewController {
            let vc = segue.destination as? individualTableViewController
            vc?.eventName =  events[indexPath!.section].name
            vc?.location = events[indexPath!.section].address!
            vc?.eventImage = events[indexPath!.section].headerImage!
        }
    }
    
    fileprivate func fetchMedia() {
        let urlString = "https://api.glimpsewearables.com/api/event/"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            /*
             guard let path = Bundle.main.path(forResource: "events", ofType: "json") else { return }
             let url = URL(fileURLWithPath: path)
             URLSession.shared.dataTask(with: url) { (data, _, err) in */
            if let err = err {
                print("failed to get data from url", err)
                return
            }
            
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let json = try decoder.decode(EventJson.self, from: data)
                self.meta = [json.meta!]
                self.events = json.objects!
                self.tableView.reloadData()
            } catch let jsonErr {
                print("Failed to decode: ", jsonErr)
            }
            print(self.meta)
            print(self.events)
            print(self.events.count)
            print("Parsed Events Properly")
            }.resume()
    }
}
