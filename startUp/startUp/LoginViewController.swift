//
//  ViewController.swift
//  startUp
//
//  Created by Alexis Macaskill on 8/29/18.
//  Copyright © 2018 Alexis Macaskill. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var LoginButtonOutlet: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loginButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    func loginButton() {
      //  LoginButtonOutlet.layer.borderColor = UIColor.whiteColor()
        LoginButtonOutlet.layer.borderWidth = 1
        LoginButtonOutlet.layer.cornerRadius = 5
    }
    
    
    @IBAction func loginClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "goToHomeSegue", sender: self)
    }
    
    @IBAction func signUpClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "toRegisterSegue", sender: self)
    }
    
}

