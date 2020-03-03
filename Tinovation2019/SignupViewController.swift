//
//  SignupViewController.swift
//  Tinovation2019
//
//  Created by Ashwin Rajesh on 2/21/20.
//  Copyright © 2020 Ashwin Rajesh. All rights reserved.
//

import Firebase
import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func schoolSignup(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: email.text!, password: password.text!, completion: {user, error in
            if (error == nil) {
                self.performSegue(withIdentifier: "home", sender: self)
            }
        })
    }
    
    @IBAction func donorSignup(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: email.text!, password: password.text!, completion: {user, error in
            if (error == nil) {
                self.performSegue(withIdentifier: "home", sender: self)
            } else {
                print(error)
            }
        })
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
