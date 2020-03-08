//
//  SchoolsListViewController.swift
//  Tinovation2019
//
//  Created by Ashwin Rajesh on 3/4/20.
//  Copyright © 2020 Ashwin Rajesh. All rights reserved.
//

import UIKit
import Firebase

var schools = [NSDictionary]()
var selectedSchool = NSDictionary()

class SchoolsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "school") as! SchoolTableViewCell
        
        cell.schoolLabel.text = schools[indexPath.row]["Name"] as! String
        
        return cell
        
    }
    
    var ref: DatabaseReference!
    @IBOutlet weak var schoolList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
    ref.child("Schools").child("1").observe(.value, with: {(data) in
            let school = data.value as! NSDictionary
            schools.append(school)
            self.schoolList.dataSource = self
            self.schoolList.delegate = self
        })
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSchool = schools[indexPath.row]
        performSegue(withIdentifier: "showSchool", sender: nil)
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
