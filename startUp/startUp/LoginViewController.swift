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
        //makes the login button have an outline
        LoginButtonOutlet.layer.borderWidth = 1
        //makes the login button have rounded edges.
        LoginButtonOutlet.layer.cornerRadius = 5
    }
    
    
    @IBAction func loginClicked(_ sender: UIButton) {
        //Sign in user
        //If user typed in a valid device ID (check with API), take user to protected page
       performSegue(withIdentifier: "toHome", sender: self)
    }
    
    
}

