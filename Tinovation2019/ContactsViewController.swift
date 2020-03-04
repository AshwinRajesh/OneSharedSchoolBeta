//
//  ContactsViewController.swift
//  
//
//  Created by Ashwin Rajesh on 12/10/19.
//

import UIKit

var name = ""

class ContactsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var contacts = ["Alice", "Bob", "David", "Christine"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath) as! ContactTableViewCell
        cell.contactName.text = contacts[indexPath.row]
        return cell
        
        
    }
    

    @IBOutlet weak var contactsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        contactsTable.dataSource = self
        contactsTable.delegate = self
        
        //language = .en
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let index = indexPath.row
        name = contacts[index]
        performSegue(withIdentifier: "messages", sender: nil)
        
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
