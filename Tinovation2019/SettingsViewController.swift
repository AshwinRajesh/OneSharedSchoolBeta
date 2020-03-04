//
//  SettingsViewController.swift
//  Tinovation2019
//
//  Created by Ashwin Rajesh on 3/3/20.
//  Copyright © 2020 Ashwin Rajesh. All rights reserved.
//

import UIKit
import Firebase


class SettingsViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageSelection: UIImageView!
    @IBOutlet weak var passwordChange: UITextField!
    @IBOutlet weak var usernameChange: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
    var ref: DatabaseReference!
    
    @IBAction func change(_ sender: UIButton) {
        if (usernameChange.text != "") {
            g_username = usernameChange.text!
        }
        let sampleImage = UIImage(named: "nophotoselected.png")
        if (imageSelection.image != sampleImage) {
            g_image = imageSelection.image
        }
        ref = Database.database().reference()
        ref.child("Users").child(g_username).setValue(["name": g_username])
        performSegue(withIdentifier: "change", sender: nil)
    }
    
    @IBAction func selectImage(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        imageSelection.image = selectedImage
        dismiss(animated: true, completion: nil)
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
