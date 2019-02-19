//
//  VideoCell.swift
//  youtubeTesting
//
//  Created by Kelson Flint on 1/28/19.
//  Copyright © 2019 Kelson Flint. All rights reserved.
//

import UIKit
import Foundation
import AVKit


class VideoCell: UITableViewCell {
    
    
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
        fatalError("init(coder:) has not been implemented")
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
    
}
