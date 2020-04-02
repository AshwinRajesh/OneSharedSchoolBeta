//
//  DonationViewController.swift
//  Tinovation2019
//
//  Created by Ashwin Rajesh on 4/1/20.
//  Copyright © 2020 Ashwin Rajesh. All rights reserved.
//

import UIKit
import Firebase

class DonationViewController: UIViewController {

    @IBOutlet weak var donationDescription: UITextView!
    @IBOutlet weak var donationTitle: UILabel!
    @IBOutlet weak var raisedLabel: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var schoolButton: UIButton!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        donationTitle.text = selectedDonation["title"] as! String
        donationDescription.text = selectedDonation["description"] as! String
        let raised = selectedDonation["raised"] as! Int
        let amount = selectedDonation["amount"] as! Int
        raisedLabel.text = "$" + String(raised) + " out of $" + String(amount)
        schoolButton.setTitle(selectedDonation["school"] as! String, for: UIControl.State.normal)
        progress.setProgress(Float(raised) / Float(amount), animated: false)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func seeSchool(_ sender: UIButton) {
        
        ref = Database.database().reference()
        
        ref.child("Schools").observeSingleEvent(of: .value, with: {(data) in
            for child in data.children.allObjects as! [DataSnapshot] {
                let school = child.value as! NSDictionary
                let schoolName = school["Name"] as! String
                if (schoolName == self.schoolButton.titleLabel!.text) {
                    selectedSchool = school
                }
            }
            self.performSegue(withIdentifier: "school", sender: nil)
            
        })
    }
}
