//
//  DonateViewController.swift
//  Tinovation2019
//
//  Created by Ashwin Rajesh on 3/2/20.
//  Copyright © 2020 Ashwin Rajesh. All rights reserved.
//

import UIKit

var donations: [[String:String]] = []

class DonateViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var donationList: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let donationOne = ["Title": "New Library", "School": "Wide Valley Middle School"]
        let donationTwo = ["Title": "Senior Graduation Ceremony", "School": "Cupertino High School"]
        donations = [donationOne, donationTwo]
        
        donationList.dataSource = self
        donationList.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return donations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "donation") as! DonateTableViewCell
        cell.schoolLabel.text = donations[indexPath.row]["School"]
        cell.donationLabel.text = donations[indexPath.row]["Title"]
        
        return cell
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
