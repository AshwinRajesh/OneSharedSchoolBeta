//
//  UserProfileViewController.swift
//  Tinovation2019
//
//  Created by Ashwin Rajesh on 3/3/20.
//  Copyright © 2020 Ashwin Rajesh. All rights reserved.
//

import UIKit

var g_username = "Bob Johnson"
var g_image: UIImage? = nil

class UserProfileViewController: UIViewController {
    
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileName.text = g_username
        profileImage.image = g_image
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
