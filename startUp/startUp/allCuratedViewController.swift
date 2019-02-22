//
//  allCuratedViewController.swift
//  startUp
//
//  Created by Alexis Macaskill on 11/10/18.
//  Copyright © 2018 Alexis Macaskill. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

protocol allCuratedViewControllerDelegate: class
{
    func setupPageController(numberOfPages: Int)
    func turnPageController(to index: Int)
}

class allCuratedViewController: UIPageViewController {
   
    var curatedVideos: [Video]? = []

   // var player: AVPlayer?
    
    //ADDED:
    //var urls: [URL]? = [URL(string: "https://youtu.be/VGRF6eFdmXk")!, URL(string: "https://youtu.be/VGRF6eFdmXk")!, URL(string: "https://youtu.be/VGRF6eFdmXk")! ]
    var eventId : Int!
    
    var images: [UIImage]? =  [UIImage(named: "lolla")!, UIImage(named: "cover")!, UIImage(named: "lolla")!, UIImage(named: "coachella")!, UIImage(named: "actualSize")! ]
    
    weak var pageViewControllerDelegate: allCuratedViewControllerDelegate?
    
    struct Storyboard {
        static let curatedViewController = "CuratedViewController"
    }
    
    lazy var controllers: [UIViewController] = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var controllers = [UIViewController]()
         /*
        //ADDED:
        if let urls = self.urls {
            for url in urls {
                let curatedUrlVC = storyboard.instantiateViewController(withIdentifier: Storyboard.curatedViewController)
                controllers.append(curatedUrlVC)
            }
        }
         */
       
        
        if let curatedVideos = self.curatedVideos {
            for video in curatedVideos {
                let curatedImageVC = storyboard.instantiateViewController(withIdentifier: Storyboard.curatedViewController)
                controllers.append(curatedImageVC)
            }
        }
        /*
        if let images = self.images {
            for image in images {
                let curatedImageVC = storyboard.instantiateViewController(withIdentifier: Storyboard.curatedViewController)
                controllers.append(curatedImageVC)
            }
        }
         */
        
        self.pageViewControllerDelegate?.setupPageController(numberOfPages: controllers.count)
        print("controller Count: ", controllers.count)
        return controllers
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  contentInsetAdjustmentBehavior = false
        automaticallyAdjustsScrollViewInsets = false
        dataSource = self
        delegate = self
        fetchMedia()
        self.turnToPage(index: 0)
        
        
        let url = URL(string: "https://youtu.be/VGRF6eFdmXk")
        
        
        // Create an AVPlayer, passing it the HTTP Live Streaming URL.
        let player = AVPlayer(url: url!)
        
        // Create a new AVPlayerViewController and pass it a reference to the player.
        let controller = AVPlayerViewController()
        controller.player = player
        
        // Modally present the player and call the player's play() method when complete.
        present(controller, animated: true) {
            player.play()
        }
        
        
    }
    
    func turnToPage(index: Int ) {
        
        if (controllers.count > 0){
        let controller = controllers[index]
        var direction = UIPageViewController.NavigationDirection.forward
        if let currentVC = viewControllers?.first {
            let currentIndex = controllers.index(of: currentVC)
            if currentIndex! > index {
                direction = .reverse
            }
        }
        self.configureDisplaying(viewController: controller)
        
        setViewControllers([controller], direction: direction, animated: true, completion: nil)
        }
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
    
    func configureDisplaying(viewController: UIViewController) {
        for (index, vc) in controllers.enumerated() {
            if viewController === vc {
                //ADDED:
                /*
                if let curatedUrlVC = viewController as? CuratedViewController {
                    let playerLayer = AVPlayerLayer(player: AVPlayer(url : (self.urls?[index])!))
                   // playerLayer.frame = curatedUrlVC.playerArea.frame
                    curatedUrlVC.playerLayer.player = AVPlayer(url: (self.urls?[index])!)
                    curatedUrlVC.playerLayer.player?.play()
                    //layer.addSublayer(playerLayer)
                  //  let player = AVPlayer(url: url)
                //    player.actionAtItemEnd = .none
               //     playerLayer.player = player
               
                  
                    self.pageViewControllerDelegate?.turnPageController(to: index)
                }
 */
                
                
                if let curatedImageVC = viewController as? CuratedViewController {
                    curatedImageVC.imageView = UIImageView(image: createThumbnailOfVideoFromRemoteUrl(url: (self.curatedVideos?[index].link!)!))
                    self.pageViewControllerDelegate?.turnPageController(to: index)
                }
 
            }
        }
        
    }
    
}


extension allCuratedViewController : UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = controllers.index(of: viewController) {
            if index > 0 {
                return controllers[index - 1]
            }
        }
        
        return controllers.last
        //return nil if dont want to wrap around.
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = controllers.index(of: viewController) {
            //not the last controller
            if index < controllers.count - 1 {
                return controllers[index + 1]
            }
        }
        return controllers.first
    }
}

extension allCuratedViewController : UIPageViewControllerDelegate {
    /*
    func pageViewController(_pageViewController: UIPageViewController, willTransitionTopendingViewControllers: [UIViewController]) {
        self.configureDisplaying(viewController: willTransitionTopendingViewControllers.first as! CuratedViewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool)
    {
        if !completed {
            self.configureDisplaying(viewController: previousViewControllers.first as! CuratedViewController)
        }
    }
 */
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController])
    {
        self.configureDisplaying(viewController: pendingViewControllers.first as! CuratedViewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool)
    {
        if !completed {
            self.configureDisplaying(viewController: previousViewControllers.first as! CuratedViewController)
        }
    }
    
    
    fileprivate func fetchMedia() {
      //  let id: String = String(eventId)
      //  let urlString = "https://api.glimpsewearables.com/media/getAllVideosUserEvent/1/\(id)"
        let urlString = "https://api.glimpsewearables.com/media/getAllVideosUserEvent/1/2"
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
                self.curatedVideos = userEvent.rawMedia!
                //self.tableView.reloadData()
            } catch let jsonErr {
                print("Failed to decode: ", jsonErr)
            }
           
            print("Parsed Media Properly")
            }.resume()
    }
    
    
    
}
