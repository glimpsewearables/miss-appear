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
  
    
   
    
    
    // Create a new AVPlayerViewController and pass it a reference to the player.
   // let controller = AVPlayerViewController()
  //  controller.player = player
 
    
 /*
    var image: UIImage? {
        didSet {
            self.imageView?.image = image
     
        }
 */
    let playerLayer = AVPlayerLayer()
    var player: AVPlayer {
        return playerLayer.player!
    }
    /*
    
    var videoLayer: AVPlayerLayer? {
        didSet {
            
            self.playerArea?.layer.addSublayer(videoLayer!)
           // (AVPlayerLayer(player: AVPlayer(url: url!)))
           
            //playerLayer.frame = curatedUrlVC.playerArea.frame
            // curatedUrlVC.playerArea.layer.addSublayer(playerLayer)
        }
    }
 */
    
    func setUpPlayerLayer() {
        playerLayer.frame = playerArea.bounds
        let url = URL(string: "https://youtu.be/VGRF6eFdmXk")
        
        let player = AVPlayer(url: url!)
   
        player.actionAtItemEnd = .none
        playerLayer.player = player
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.imageView.image = image
        //self.playerArea?.layer.addSublayer(videoLayer!)
       // let url = URL(string: "https://youtu.be/VGRF6eFdmXk")
        setUpPlayerLayer()
        playerArea.layer.addSublayer(playerLayer)
        
        // Create an AVPlayer, passing it the HTTP Live Streaming URL.
  // let player = AVPlayer(url: url!)
    //    let playerLayer = AVPlayerLayer(player: player)
      //  playerLayer.frame = playerArea.frame
       // playerArea.layer.addSublayer(playerLayer)
        
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
