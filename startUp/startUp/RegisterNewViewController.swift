//
//  RegisterNewViewController.swift
//  startUp
//
//  Created by Alexis Macaskill on 9/24/18.
//  Copyright © 2018 Alexis Macaskill. All rights reserved.
//

import UIKit

class RegisterNewViewController: UIViewController {

    @IBOutlet weak var signUpButtonOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButton()
    }
    
    func signUpButton() {
        //  LoginButtonOutlet.layer.borderColor = UIColor.whiteColor()
        signUpButtonOutlet.layer.borderWidth = 1
        signUpButtonOutlet.layer.cornerRadius = 5
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
