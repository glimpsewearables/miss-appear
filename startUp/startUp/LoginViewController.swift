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
        //Sign in user
        //If username and password is correct, take user to protected page
        var myTabBar = self.storyboard?.instantiateViewController(withIdentifier: "myTabBar") as! UITabBarController
        var appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = myTabBar
        
       // performSegue(withIdentifier: "goToHomeSegue", sender: self)
    }
    
    @IBAction func signUpClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "toRegisterSegue", sender: self)
    }
    
}

