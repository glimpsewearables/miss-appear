//
//  individualTableViewController.swift
//  startUp
//
//  Created by Alexis Macaskill on 10/30/18.
//  Copyright © 2018 Alexis Macaskill. All rights reserved.
//

import UIKit

class CollectionViewCells:  UICollectionViewCell  {

     //var images2 = ["lolla", "bumpershoot", "coachella", "lolla", "bumpershoot", "coachella", "lolla", "bumpershoot", "coachella", "lolla", "bumpershoot", "coachella", "lolla", "bumpershoot", "coachella", "coachella", "lolla", "bumpershoot", "coachella", "lolla", "bumpershoot", "coachella", "coachella", "lolla"]
    
    @IBOutlet weak var picture: UIImageView!
    //var setPicture = images2
}


class SingleEventCells: UITableViewCell, UICollectionViewDelegate {//UICollectionViewDataSource {
    /*
     var images1 = ["lolla", "bumpershoot", "coachella", "lolla", "bumpershoot", "coachella", "lolla", "bumpershoot", "coachella", "lolla", "bumpershoot", "coachella", "lolla", "bumpershoot", "coachella", "coachella", "lolla", "bumpershoot", "coachella", "lolla", "bumpershoot", "coachella", "coachella", "lolla"]
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "theScrollCell", for: indexPath) as! CollectionViewCells
        
        //cell.interest = interests[indexPath.item]
       // cell.image2.image = UIImage(named: images1[Int.random(in: 0 ..< images1.count - 1)])
        
        cell.picture.image = UIImage(named: images1[Int.random(in: 0 ..< images1.count - 1)])
        return cell
    }
    /*
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.scrollView.dataSource = self
        self.scrollView.delegate = self
        self.scrollView.register(UINib.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "theScrollCell")
        
    }
    */
 */
   
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var scrollView: UICollectionView!
    @IBOutlet weak var label2: UILabel!
}

//extension SingleEventCells: UITableViewCell {
   /*
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {
        let layout = self.scrollView?.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
 */
    
//}

class titleCell: UITableViewCell {
    
}
/*
protocol MyCellDelegate {
    func cellWasPressed()
}
*/
class galleryCells: UITableViewCell {
    /*
    var delegate: MyCellDelegate?
    @IBAction func categoryButtonAction(_ sender: Any) {
        
            self.delegate?.viewImage()
        }
    }
    
    @IBOutlet weak var left: UIImageView!{
        didSet {
            let imageTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(getter: left))
            left.addGestureRecognizer(imageTapGestureRecognizer)
            left.isUserInteractionEnabled = true
            left.tag = tag
        }

    }
    func viewImage(_ sender: AnyObject) {
        let tag = sender.view.tag
        performSegue(withIdentifier: "bigPicture", sender: "")
    }
    //left.isUserInteractionEnabled = true;
    let singleTap = UITapGestureRecognizer(target: self,action:#selector(getter: galleryCells.left))
  // left.isUserInteractionEnabled = true
   // left.addGestureRecognizer(singleTap)
 */

   var clickedImage = UIImage(named: "cover")
    var clickedAway = false
    @IBAction func rightButtonClicked(_ sender: Any) {
        
       
        clickedImage = rightOutlet.imageView?.image
    }
    
     @IBOutlet weak var rightOutlet: UIButton!
    @IBOutlet weak var middleOutlet: UIButton!
    
    @IBOutlet weak var leftOutlet: UIButton!
    
 func getImage()-> UIImage {
        
        return clickedImage!
    }
    
    func getRightImage()-> UIImage {
        
        return rightOutlet.image(for: UIControl.State.normal)!
    }
   

    
}

class individualTableViewController: UITableViewController {
    @IBOutlet weak var eventTitle: UILabel!
    
    @IBOutlet weak var dateTitle: UILabel!
    @IBOutlet weak var headerView: HeaderView!
    var eventName : String = ""
    var location: String = ""
    var eventImage: String = ""
    var path  : IndexPath?
    var refreshBarButtonActivityIndicator: UIBarButtonItem!
    


    @IBOutlet weak var refreshOutlet: UIBarButtonItem!
    
    @IBAction func refreshButton(_ sender: UIBarButtonItem) {
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView.init(style: .gray)
        refreshBarButtonActivityIndicator = UIBarButtonItem(customView: activityIndicator)
        activityIndicator.startAnimating()
        
        self.navigationItem.rightBarButtonItem = refreshBarButtonActivityIndicator
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.navigationItem.rightBarButtonItem = self.refreshOutlet
        }
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        //update stuff from API
        eventTitle.text = getName();
        dateTitle.text = getDate();
        
    }
    func getDate() -> String {
        //pull from API
        return "Date - Date"
    }
    
    func getName() -> String {
        //Pull from API
        return "Name"
    }
    
    
    
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CuratedViewController" {
            if let curatedImageVC = segue.destination as? allCuratedViewController {
                //curatedImageVC.image =
                curatedImageVC.pageViewControllerDelegate = headerView as! allCuratedViewControllerDelegate;
            }
        }
    }
 */
    
    var images = ["lolla", "bumpershoot", "coachella", "lolla", "bumpershoot", "coachella", "lolla", "bumpershoot", "coachella", "lolla", "bumpershoot", "coachella", "lolla", "bumpershoot", "coachella", "coachella", "lolla", "bumpershoot", "coachella", "lolla", "bumpershoot", "coachella", "coachella", "lolla"]


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return images.count + 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
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
            
          //  if (eventImage == "lolla") {
            //    cell.image2.image = UIImage(named: "cover")
         //   } else {
                //cell.image2.image = UIImage(named: eventImage)
          //  }
            
            //cell.image2.contentMode = .scaleAspectFill
            return cell

        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "galleryCell", for: indexPath) as! galleryCells
            
            cell.leftOutlet.setImage(UIImage(named: images[Int.random(in: 0 ..< images.count - 1)]), for: UIControl.State.normal)
            cell.leftOutlet.imageView?.contentMode = UIView.ContentMode.scaleAspectFill
            
            cell.middleOutlet.setImage(UIImage(named: images[Int.random(in: 0 ..< images.count - 1)]), for: UIControl.State.normal)
            cell.middleOutlet.imageView?.contentMode = UIView.ContentMode.scaleAspectFill
           
            cell.rightOutlet.setImage(UIImage(named: images[Int.random(in: 0 ..< images.count - 1)]), for: UIControl.State.normal)
            cell.rightOutlet.imageView?.contentMode = UIView.ContentMode.scaleAspectFill
            path = tableView.indexPathForSelectedRow
            return cell
        }
       

        //return cell
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    
        // Get the new view controller using segue.destination.
        if segue.identifier == "rightToBig" {
            //if segue.destination is bigPictureViewController {
            let vc = segue.destination as? bigPictureViewController
           // let aGalleryCell = galleryCells()
           // vc?.theImage =  aGalleryCell.getImage()
            //let cell = tableView.cellForRow(at: path!) as! galleryCells
            //vc?.theImage = (cell.rightOutlet.imageView?.image)!
        }
        if segue.identifier == "middleToBig" {
            //if segue.destination is bigPictureViewController {
            let vc = segue.destination as? bigPictureViewController
            // let aGalleryCell = galleryCells()
            // vc?.theImage =  aGalleryCell.getImage()
            //let cell = tableView.cellForRow(at: path!) as! galleryCells
          //  vc?.theImage = (cell.middleOutlet.imageView?.image)!
        }
        if segue.identifier == "leftToBig" {
            //if segue.destination is bigPictureViewController {
            let vc = segue.destination as? bigPictureViewController
            // let aGalleryCell = galleryCells()
            // vc?.theImage =  aGalleryCell.getImage()
            //let cell = tableView.cellForRow(at: path!) as! galleryCells
           // vc?.theImage = (cell.leftOutlet.imageView?.image)!
            
            
            //need to move picturer to next screen
        }
        
    }
    

    

}
