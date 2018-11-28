//
//  ViewController.swift
//  ugh
//
//  Created by Kelson Flint on 11/24/18.
//  Copyright © 2018 Kelson Flint. All rights reserved.
//

import UIKit

class MediaController: UITableViewController {
    
    var media = [Media]() //array of media data
    var meta = [Meta]() //meta data
    
    struct Json: Decodable {
        let meta: Meta!
        let objects: [Media]!
    }
    
    struct Meta: Decodable {
        let limit: Int?
        let next: String?
        let offset: Int?
        let previous: String?
        let totalCount: Int?
    }
    
    struct Media: Decodable {
        let createdAt: String?
        let downloaded: Int?
        let id: Int
        let link: String?
        let mediaType: String?
        let ranking: Int?
        let rawOrEdited: String?
        let resourceUri: String?
        let updatedAt: String?
    }
    
    //fetches data from api, converts json into arrays of the meta data and media
    fileprivate func fetchMedia() {
        let urlString = "http://52.32.199.147:8000/api/media/"
        guard let url = URL(string: urlString) else {return}
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
                    self.media = json.objects!
                    self.tableView.reloadData()
                } catch let jsonErr {
                    print("Failed to decode: ", jsonErr)
                }
            print("Parsed Json Properly")
            }.resume()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMedia()
    }
    
    //number of rows in table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return media.count
    }
    
    // simply displays image id and url
    // need to figure out how to display images in tableview
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellID")
        let image = media[indexPath.row]
        cell.textLabel?.text = image.link
        cell.detailTextLabel?.text = image.createdAt
        return cell
    }
    
}

