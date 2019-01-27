//
//  CuratedViewController.swift
//  startUp
//
//  Created by Alexis Macaskill on 11/10/18.
//  Copyright © 2018 Alexis Macaskill. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class CuratedViewController: UIViewController {

    @IBOutlet var playerArea: UIView!
    @IBOutlet weak var imageView: UIImageView!
     var player: AVPlayer?
    
   
    
    
    // Create a new AVPlayerViewController and pass it a reference to the player.
   // let controller = AVPlayerViewController()
  //  controller.player = player
 
    
 
    var image: UIImage? {
        didSet {
            self.imageView?.image = image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = image
        let url = URL(string: "https://youtu.be/VGRF6eFdmXk")
        
        
        // Create an AVPlayer, passing it the HTTP Live Streaming URL.
        let player = AVPlayer(url: url!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = playerArea.frame
        playerArea.layer.addSublayer(playerLayer)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
