//
//  SchoolProfileViewController.swift
//  FirebaseAuth
//
//  Created by Ashwin Rajesh on 2/21/20.
//

import UIKit

class SchoolProfileViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var goalProgress: UIProgressView!
    @IBOutlet weak var goalName: UILabel!
    @IBOutlet weak var schoolImage: UIImageView!
    @IBOutlet weak var schoolName: UILabel!

    @IBOutlet weak var schoolDescription: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        schoolName.text = selectedSchool["Name"] as! String
        let goalDescription = "Paint and Textbooks"
        let progress = selectedSchool["Raised"] as! Int
        let goal = selectedSchool["Funding Goal"] as! Int
        
        goalProgress.setProgress(Float(progress) / Float(goal), animated: false)
        goalName.text = goalDescription
        schoolDescription.text = selectedSchool["Description"] as! String
        
    }
    
    
    @IBAction func `return`(_ sender: UIButton) {
        self.navigationController?.dismiss(animated: true)
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
