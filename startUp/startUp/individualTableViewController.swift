//
//  individualTableViewController.swift
//  startUp
//
//  Created by Alexis Macaskill on 10/30/18.
//  Copyright © 2018 Alexis Macaskill. All rights reserved.
//

import UIKit
import AVKit
import Foundation




class titleCell: UITableViewCell {
    
}

class galleryCells: UITableViewCell {
    /*
    var video: Video? {
        didSet {
            thumbnailImageView.image = getThumbnailImage(forUrl: URL(string: (video?.link)!)!)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    
    func setupViews() {
        addSubview(thumbnailImageView)
        
        thumbnailImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        thumbnailImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        thumbnailImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        thumbnailImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        //set description anchors
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
      //  fatalError("init(coder:) has not been implemented")
    }
    
    // get thumbnail from video url
    func getThumbnailImage(forUrl url: URL) -> UIImage? {
        let asset: AVAsset = AVAsset(url: url)
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        
        do {
            let thumbnailImage = try imageGenerator.copyCGImage(at: CMTimeMake(value: 1, timescale: 60) , actualTime: nil)
            return UIImage(cgImage: thumbnailImage)
        } catch let error {
            print(error)
        }
        
        return nil
    }
    
*/
 //  var clickedImage = UIImage(named: "cover")
   // var clickedAway = false
    @IBAction func rightButtonClicked(_ sender: Any) {
        
       
       
    }
    
     @IBOutlet weak var rightOutlet: UIButton!
    
    @IBOutlet weak var leftOutlet: UIButton!
    

    @IBOutlet weak var middleOutlet: UIButton!
    
}

class individualTableViewController: UITableViewController {
    @IBOutlet weak var eventTitle: UILabel!
    
    @IBOutlet weak var dateTitle: UILabel!
    @IBOutlet weak var headerView: HeaderView!
    var location: String = ""
    var eventImage: String = ""
    var path  : Int?
    var refreshBarButtonActivityIndicator: UIBarButtonItem!
    var timer: Timer!


    @IBOutlet weak var refreshOutlet: UIBarButtonItem!
    
    @IBAction func refreshButton(_ sender: UIBarButtonItem) {
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView.init(style: .gray)
        refreshBarButtonActivityIndicator = UIBarButtonItem(customView: activityIndicator)
        activityIndicator.startAnimating()
        
        self.navigationItem.rightBarButtonItem = refreshBarButtonActivityIndicator
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.navigationItem.rightBarButtonItem = self.refreshOutlet
        
    }
        fetchMedia()
    }

   
 
    override func viewDidLoad() {
        super.viewDidLoad()
        //update stuff from API
        fetchMedia()
        eventTitle.text = eventName;
        navigationItem.title = eventName
        dateTitle.text = location;
        tableView.register(galleryCells.self, forCellReuseIdentifier: "cellId")
        
    }

    
    
    
    var images = ["lolla", "bumpershoot", "coachella", "lolla", "bumpershoot", "coachella", "lolla", "bumpershoot", "coachella", "lolla", "bumpershoot", "coachella", "lolla", "bumpershoot", "coachella", "coachella", "lolla", "bumpershoot", "coachella", "lolla", "bumpershoot", "coachella", "coachella", "lolla"]
    var videos = [Video]() //array of media data
    var eventId : Int!
    var eventName: String?
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        //return images.count + 2
        return ((videos.count/3) + 1)
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0 ) {
            return CGFloat(50.0)
        } else {
            return CGFloat(94.0)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0 ) {
      
            let cell = tableView.dequeueReusableCell(withIdentifier: "plain", for: indexPath) as! titleCell
            return cell

        }else {
            
           // let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "galleryCells")
            let cell = tableView.dequeueReusableCell(withIdentifier: "galleryCell", for: indexPath) as! galleryCells
           let videoleft = videos[(indexPath.section*3) - 1]
            let videoright = videos[(indexPath.section*3) + 1]
            let videomiddle = videos[(indexPath.section*3)]
            
            var imageleft = createThumbnailOfVideoFromRemoteUrl(url: videoleft.link!)
            var imageright = createThumbnailOfVideoFromRemoteUrl(url: videoright.link!)
            var imagemiddle = createThumbnailOfVideoFromRemoteUrl(url: videomiddle.link!)
            cell.leftOutlet.setImage(imageleft, for: [])
            cell.rightOutlet.setImage(imageright, for: [])
            cell.middleOutlet.setImage(imagemiddle, for: [])
            path = indexPath.section - 1
            return cell
        }
    }
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("User tapped on item \(indexPath.section)")
        path = indexPath.section - 1
    }
  
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
    
        // Get the new view controller using segue.destination.
        if segue.identifier == "rightToBig" {
            let vc = segue.destination as? bigPictureViewController
            vc?.videoLink = videos[(path! * 3) + 2].link
           
        }

        if segue.identifier == "leftToBig" {
      
            let vc = segue.destination as? bigPictureViewController
            vc?.videoLink = videos[(path! * 3)].link
        }
        
        if segue.identifier == "middleToBig" {
            
            let vc = segue.destination as? bigPictureViewController
            vc?.videoLink = videos[(path! * 3) + 1].link
        }
        
    }
    

    fileprivate func fetchMedia() {
        let id: String = String(eventId)
        let urlString = "https://api.glimpsewearables.com/media/getAllVideosUserEvent/1/\(id)"
        //let urlString = "https://api.glimpsewearables.com/media/getAllVideosUserEvent/1/2"
        print(urlString)
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            /*
             guard let path = Bundle.main.path(forResource: "user1event1", ofType: "json") else { return }
             let url = URL(fileURLWithPath: path)
             URLSession.shared.dataTask(with: url) { (data, _, err) in
             */
            if let err = err {
                print("failed to get data from url", err)
                return
            }
            
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let json = try decoder.decode(VideoJson.self, from: data)
                let userEvent = json.userEventVideos
                self.videos = userEvent.rawMedia!
                self.tableView.reloadData()
            } catch let jsonErr {
                print("Failed to decode: ", jsonErr)
            }
            //print(self.videos)
            print(self.videos.count)
            print("Parsed Media Properly")
            }.resume()
    }
    
    func createThumbnailOfVideoFromRemoteUrl(url: String) -> UIImage? {
        let asset = AVAsset(url: URL(string: url)!)
        let assetImgGenerate = AVAssetImageGenerator(asset: asset)
        assetImgGenerate.appliesPreferredTrackTransform = true
        //Can set this to improve performance if target size is known before hand
        //assetImgGenerate.maximumSize = CGSize(width,height)
        let time = CMTimeMakeWithSeconds(1.0, preferredTimescale: 600)
        do {
            let img = try assetImgGenerate.copyCGImage(at: time, actualTime: nil)
            let thumbnail = UIImage(cgImage: img)
            return thumbnail
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }

}
