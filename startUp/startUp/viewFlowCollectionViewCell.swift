//
//  viewFlowCollectionViewCell.swift
//  startUp
//
//  Created by Alexis Macaskill on 11/10/18.
//  Copyright © 2018 Alexis Macaskill. All rights reserved.
//

import UIKit

//class scrollCell: UICollectionViewCell {
    
//}

class viewFlowCollectionViewCell: UICollectionViewController {
  
    var images = ["lolla", "bumpershoot", "coachella", "lolla", "bumpershoot", "coachella", "lolla", "bumpershoot", "coachella", "lolla", "bumpershoot", "coachella", "lolla", "bumpershoot", "coachella", "coachella", "lolla", "bumpershoot", "coachella", "lolla", "bumpershoot", "coachella", "coachella", "lolla"]


//extension viewFlowCollectionViewCell : UICollectionViewDataSource
//{
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "theScrollCell", for: indexPath) as! scrollCell
        
        //cell. = images[indexPath.item]
        
        return cell
    }
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {
        let layout = self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}

//extension InterestsViewController : UIScrollViewDelegate, UICollectionViewDelegate
//{

//}







