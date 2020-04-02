//
//  SearchBarViewController.swift
//  Tinovation2019
//
//  Created by Ashwin Rajesh on 4/1/20.
//  Copyright © 2020 Ashwin Rajesh. All rights reserved.
//

import UIKit
import Firebase

var allUsers: [String] = []

class SearchBarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    var ref: DatabaseReference!
    
    let userSample = ["Bob", "Mary", "John"]
    var results: [String] = []
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty == false {
            results = allUsers.filter({$0.contains(searchText)})
        } else {
            results = allUsers
        }
        suggestions.reloadData()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "suggestion") as! SuggestionTableViewCell
        
        cell.suggestionName.text = results[indexPath.row]
        
        return cell
    }
    

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var suggestions: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        ref.child("Users").observe(.value, with: {(data) in
            for child in data.children.allObjects as! [DataSnapshot] {
                let dict = child.value as! NSDictionary
                let user = dict["username"] as! String
                if (g_username != user) {
                    allUsers.append(user)
                }
            }
            
            self.results = allUsers
            self.searchBar.delegate = self
            self.suggestions.delegate = self
            self.suggestions.dataSource = self
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
        selectedUser = results[indexPath.row]
        performSegue(withIdentifier: "create", sender: nil)
    }

    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.dismiss(animated: true)
    }
}
