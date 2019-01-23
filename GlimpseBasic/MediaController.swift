//
//  MediaController.swift
//  GlimpseBasic
//
//  Created by Kelson Flint on 1/12/19.
//  Copyright © 2019 Kelson Flint. All rights reserved.
//
/*
 {
 "media_type": "video",
 "ranking": 1,
 "updated_at": "2018-12-12 01:17:36.260800+00:00",
 "raw_or_edited": "raw",
 "link": "https:\/\/s3-us-west-2.amazonaws.com\/users-raw-content\/user1_video_2018-12-01_11.38.34.mp4",
 "created_at": "2018-12-12 01:17:36.260763+00:00",
 "downloaded": 0,
 "user_id": "1",
 "event_id": "1",
 "gif_link": "",
 "device_id": "1"
 },
 */

import Foundation
import UIKit
import AVKit

class MediaController: UITableViewController {
    
    struct Media: Decodable {
        let mediaType: String?
        let ranking: Int?
        let updatedAt: String?
        let rawOrEdited: String?
        let link: String?
        let createdAt: String?
        let downloaded: Int?
        let userId: String?
        let eventId: String?
        let gifLink: String?
        let deviceId: String?
    }

    struct UserEventVideos: Decodable {
        let media: [Media]!
    }
    
    struct Json: Decodable {
        let userEventVideos: UserEventVideos
    }
    
    var media = [Media]() //array of media data
    
    //fetches data from api, converts json into arrays of the meta data and media
    fileprivate func fetchMedia() {
        let urlString = "http://52.88.225.198:8000/media/getAllVideosUserEvent/1/1"
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
                let userEvent = json.userEventVideos
                self.media = userEvent.media!
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
        print(media)
    }
    
    //number of rows in table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return media.count
    }
    
    // simply displays image id and url
    // need to figure out how to display images in tableview
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellID")
        let video = media[indexPath.row]
        cell.textLabel?.text = video.link
        cell.detailTextLabel?.text = video.createdAt
        /*
        let videoURL = NSURL(string: video.link!)
        let player = AVPlayer(url: videoURL! as URL)
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = cell.bounds
        
        cell.layer.addSublayer(playerLayer)
        player.play()
 */
        return cell
    }
    
}

