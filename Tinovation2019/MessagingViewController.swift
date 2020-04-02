//
//  MessagingViewController.swift
//  Tinovation2019
//
//  Created by Ashwin Rajesh on 11/4/19.
//  Copyright © 2019 Ashwin Rajesh. All rights reserved.
//

import Firebase
import UIKit

var selectedUser = ""

//var toggle = "other"

class MessagingViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var ref: DatabaseReference!
    
    @IBOutlet weak var contactName: UILabel!
    
    @IBOutlet weak var message: UITextField!
    
    @IBOutlet weak var messageView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let sender = users[indexPath.row]

        if (sender != g_username) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OtherMessage", for: indexPath) as! OtherCollectionViewCell
            let message = messages[indexPath.row]
            cell.textLabel.text = message
            /*let width = message.count * 15
            cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: CGFloat(width), height: cell.frame.height)*/
            cell.contentView.layer.cornerRadius = 2.0
            cell.contentView.layer.borderWidth = 1.0
            cell.contentView.layer.borderColor = UIColor.clear.cgColor
            cell.contentView.layer.masksToBounds = true
            cell.layer.shadowColor = UIColor.lightGray.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
            cell.layer.shadowRadius = 10.0
            cell.layer.shadowOpacity = 1.0
            cell.layer.masksToBounds = false
            cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
            cell.layer.cornerRadius = 10.0
            
            
            return cell
            
        } else {
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserMessage", for: indexPath) as! UserCollectionViewCell
            let message = messages[indexPath.row]
            cell.textLabel.text = message
            cell.contentView.layer.cornerRadius = 2.0
            cell.contentView.layer.borderWidth = 1.0
            cell.contentView.layer.borderColor = UIColor.clear.cgColor
            cell.contentView.layer.masksToBounds = true
            cell.layer.shadowColor = UIColor.lightGray.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
            cell.layer.shadowRadius = 10.0
            cell.layer.shadowOpacity = 1.0
            cell.layer.masksToBounds = false
            cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
            cell.layer.cornerRadius = 10.0
            /*let width = message.count * 10
            cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: CGFloat(width), height: cel.frame.height)*/
           
            return cell
        }
        
    }
    
    
    
    

    
    var messages: [String] = []
    var users: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        contactName.text = selectedUser
        ref.child("Messages").observe(.value, with: {(data) in
            for child in data.children.allObjects as! [DataSnapshot] {
                let dict = child.value as! NSDictionary
                let people = dict["participants"] as! [String]
                let userTwo = dict["userTwo"] as! String
                let userOne = dict["userOne"] as! String
                if ((userOne == selectedUser && userTwo == g_username) || (userTwo == selectedUser && userOne == g_username)) {
                    let chat = dict["chat"] as! [String]
                    if (chat.count > 5) {
                        self.messages = Array(chat.suffix(5))
                        self.users = Array(people.suffix(5))
                    } else {
                        self.users = people
                        self.messages = chat
                    }
                    print(self.messages)
                    print(self.users)
                    self.messageView.delegate = self
                    self.messageView.dataSource = self
                    
                }
            }
            
        })
        
        /*
        let options = TranslatorOptions(sourceLanguage: .en, targetLanguage: language)
        let translator = NaturalLanguage.naturalLanguage().translator(options: options)
        
        let conditions = ModelDownloadConditions(
            allowsCellularAccess: false,
            allowsBackgroundDownloading: true
        )
        translator.downloadModelIfNeeded(with: conditions) { error in
            guard error == nil else { return }
            
            // Model downloaded successfully. Okay to start translating.
        }
        
        translator.translate("Hello") { translatedText, error in
            if (error == nil) {
                self.message.keyboardType = .asciiCapable
                self.messages.append(translatedText!)
                self.users.append("Other")
                print(self.messages)
                self.messageView.dataSource = self
                self.messageView.delegate = self
            } else {
                print(error!)
            }
            // Translation succeeded.
        }
       

        // Do any additional setup after loading the view.
       */
    }
    
    @IBAction func sendMessage(_ sender: UIButton) {
        print("Test")
        ref = Database.database().reference()
        
        ref.child("Messages").observeSingleEvent(of: .value, with: {(data) in
            var new = true
            let snapshots = data.children.allObjects as! [DataSnapshot]
            print(snapshots.count)
            for (i, child) in snapshots.enumerated() {
                print(i)
                let dict = child.value as! NSDictionary
                var people = dict["participants"] as! [String]
                let userTwo = dict["userTwo"] as! String
                let userOne = dict["userOne"] as! String
                if ((userOne == selectedUser && userTwo == g_username) || (userTwo == selectedUser && userOne == g_username)) {
                    new = false
                    var chat = dict["chat"] as! [String]
                    let id = child.key
                    print(id)
                    chat.append(self.message.text!)
                    people.append(g_username)
                self.ref.child("Messages").child(id).setValue(["userOne": userOne, "userTwo": userTwo, "participants": people, "chat": chat])
                 self.messages.append(self.message.text!)
                    self.users.append(g_username)
                    
                }
            }
            if (new == true) {
               let chat = [self.message.text!]
               let people = [g_username]
                self.messages.append(self.message.text!)
                self.users.append(g_username)
                self.ref.child("Messages").childByAutoId().setValue(["userOne": g_username, "userTwo": selectedUser, "participants": people, "chat": chat])
            }
            
            self.messageView.reloadData()
            
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

    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.dismiss(animated: true)
    }
}
