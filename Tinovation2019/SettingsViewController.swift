//
//  SettingsViewController.swift
//  Tinovation2019
//
//  Created by Ashwin Rajesh on 3/3/20.
//  Copyright © 2020 Ashwin Rajesh. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageSelection: UIImageView!
    @IBOutlet weak var passwordChange: UITextField!
    @IBOutlet weak var usernameChange: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func change(_ sender: UIButton) {
        if (usernameChange.text != "") {
            g_username = usernameChange.text!
        }
        if (imageSelection.image != nil) {
            g_image = imageSelection.image
        }
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
