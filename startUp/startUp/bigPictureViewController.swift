//
//  bigPictureViewController.swift
//  startUp
//
//  Created by Alexis Macaskill on 11/27/18.
//  Copyright © 2018 Alexis Macaskill. All rights reserved.
//

import UIKit

class bigPictureViewController: UIViewController {
    var theImage : UIImage = UIImage(named: "cover")!
    
    @IBOutlet weak var pictureOutlet: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        pictureOutlet.image = theImage
        
        // Do any additional setup after loading the view.
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
