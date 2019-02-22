//
//  bigPictureViewController.swift
//  startUp
//
//  Created by Alexis Macaskill on 11/27/18.
//  Copyright © 2018 Alexis Macaskill. All rights reserved.
//

import UIKit
import Foundation
import AVKit
import AVFoundation

class bigPictureViewController: UIViewController {
    var videoLink : String?
    
    @IBOutlet weak var pictureOutlet: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let videoURL = URL(string: videoLink!)
        let player = AVPlayer(url: videoURL!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer)
        player.play()
        
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
