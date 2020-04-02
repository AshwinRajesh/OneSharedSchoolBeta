//
//  DonationsListViewController.swift
//  Tinovation2019
//
//  Created by Ashwin Rajesh on 3/31/20.
//  Copyright © 2020 Ashwin Rajesh. All rights reserved.
//


import Firebase
import UIKit

var selectedDonation: [String: Any] = [:]
var userDonations: [[String: Any]] = []

class DonationsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var donationTableView: UITableView!
    var ref: DatabaseReference!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userDonations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "donation") as! DonationTableViewCell
        
        let donation = userDonations[indexPath.row]
        let title = donation["title"] as! String
        let school = donation["school"] as! String
        let amount = donation["amount"] as! Int
        
        cell.donationAmount.text = "$" + String(amount)
        cell.donationSchool.text = school
        cell.donationTitle.text = title
        
        return cell
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        ref.child("Donations").observeSingleEvent(of: .value, with: {(data) in
            for child in data.children.allObjects as! [DataSnapshot] {
                let dict = child.value as! NSDictionary
                let donor = dict["donor"] as! String
                print(g_username)
                if (donor == g_username) {
                    userDonations.append(dict as! [String : Any])
                    print(userDonations)
                }
            }
        
            self.donationTableView.dataSource = self
            self.donationTableView.delegate = self
            
        })
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedDonation = userDonations[indexPath.row]
        performSegue(withIdentifier: "donation", sender: nil)
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
}
