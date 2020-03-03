//
//  SchoolProfileViewController.swift
//  FirebaseAuth
//
//  Created by Ashwin Rajesh on 2/21/20.
//

import UIKit

class SchoolProfileViewController: UIViewController {

    @IBOutlet weak var goalProgress: UIProgressView!
    @IBOutlet weak var goalName: UILabel!
    @IBOutlet weak var schoolImage: UIImageView!
    @IBOutlet weak var schoolName: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        schoolName.text = schools[selectedSchool]
        let goal = [String](goals.keys)[selectedSchool]
        goalProgress.setProgress(goals[goal]!, animated: false)
        goalName.text = goal
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
