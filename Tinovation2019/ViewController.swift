//
//  ViewController.swift
//  Tinovation2019
//
//  Created by Ashwin Rajesh on 11/2/19.
//  Copyright © 2019 Ashwin Rajesh. All rights reserved.
//

import UIKit
import Firebase

//var language: TranslateLanguage = .ja

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languages.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languages[row]
    }
    

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var languagePicker: UIPickerView!
    
    var languages = ["English", "Spanish", "French", "Hindi", "Mandarin", "Japanese"]
    
    //var langAbv: [TranslateLanguage] = [.en, .es, .fr, .hi, .cs, .ja]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        languagePicker.delegate = self
        languagePicker.dataSource = self
        
    }
    
    
    @IBAction func translate(_ sender: UIButton) {
        
        //language = langAbv[languagePicker.selectedRow(inComponent: 0)]
        
        
    }
    

}

