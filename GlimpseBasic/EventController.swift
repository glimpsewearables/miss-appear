//
//  EventController.swift
//  GlimpseBasic
//
//  Created by Kelson Flint on 1/14/19.
//  Copyright © 2019 Kelson Flint. All rights reserved.
//

/*
 {
 "address": "",
 "created_at": true,
 "end_date": null,
 "id": 0,
 "lat": "0.000",
 "long": "0.000",
 "name": "Miscellaneous",
 "resource_uri": "\/api\/event\/0\/",
 "start_date": null,
 "updated_at": true
 },
 */

import Foundation
import UIKit

class EventController: UITableViewController {
    
    var events = [Event]() //array of media data
    var meta = [Meta]() //meta data
    
    struct Json: Decodable {
        let meta: Meta!
        let objects: [Event]!
    }
    
    struct Meta: Decodable {
        let limit: Int?
        let next: String?
        let offset: Int?
        let previous: String?
        let totalCount: Int?
    }
    
    struct Event: Decodable {
        let address: String?
        let createdAt: String!
        let endDate: String?
        let id: Int
        let lat: String?
        let long: String?
        let name: String?
        let resourceUri: String?
        let startDate: String?
        let updatedAt: String?
    }
    
    //fetches data from api, converts json into arrays of the meta data and media
    fileprivate func fetchMedia() {
        /*let urlString = "http://52.88.225.198:8000/api/event/"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, _, err) in
 */
        guard let path = Bundle.main.path(forResource: "events", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            if let err = err {
                print("failed to get data from url", err)
                return
            }
            
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let json = try decoder.decode(Json.self, from: data)
                self.meta = [json.meta!]
                self.events = json.objects!
                self.tableView.reloadData()
            } catch let jsonErr {
                print("Failed to decode: ", jsonErr)
            }
            print(self.meta)
            print(self.events)
            print(self.events.count)
            print("Parsed Json Properly")
            }.resume()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMedia()
    }
    
    //number of rows in table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    // simply displays image id and url
    // need to figure out how to display images in tableview
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellID")
        let event = events[indexPath.row]
        cell.textLabel?.text = event.name
        cell.detailTextLabel?.text = String(event.id)
        return cell
    }
    
}

