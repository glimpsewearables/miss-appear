//
//  EventController.swift
//  youtubeTesting
//
//  Created by Kelson Flint on 1/29/19.
//  Copyright © 2019 Kelson Flint. All rights reserved.
//

import Foundation
import UIKit

class EventController : UITableViewController {
    
    var events = [Event]() //array of media data
    var meta = [Meta]() //meta data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Events"
        fetchMedia()
        tableView.backgroundColor = UIColor.white
       // tableView.register(EventCell.self, forCellReuseIdentifier: "cellId")
        
    }
     /*
     
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellID")
        let event = events[indexPath.row]
        cell.textLabel?.text = event.name
        cell.detailTextLabel?.text = String(event.id)
        return cell
    }
    
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedEvent = events[indexPath.row]
        //let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        let destinationView = MediaController()
        destinationView.eventId = indexPath.row + 1
        destinationView.eventName = selectedEvent.name!
        self.navigationController?.pushViewController(destinationView, animated: true)
    }
 
 */
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
