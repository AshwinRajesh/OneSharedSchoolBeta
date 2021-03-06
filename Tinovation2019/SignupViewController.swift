//
//  SignupViewController.swift
//  Tinovation2019
//
//  Created by Ashwin Rajesh on 2/21/20.
//  Copyright © 2020 Ashwin Rajesh. All rights reserved.
//

import Firebase
import UIKit

var g_username = ""
class SignupViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var name: UITextField!
    
    var ref: DatabaseReference!
    
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
        
        ref = Database.database().reference()
        
        g_username = name.text!
        g_image = UIImage(named: "nophotoselected.png")
        Auth.auth().createUser(withEmail: email.text!, password: password.text!, completion: {user, error in
            if (error == nil) {
                self.ref.child("Users").child(self.name.text!).setValue(["username": self.name.text!, "email": self.email.text!])
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
