//
//  ViewController.swift
//  LabUIText-Week3
//
//  Created by user237087 on 1/23/24.
//

import UIKit

class ViewController: UIViewController {
    
    var flag: Bool = true;
    var userData = (firstname:"", lastname: "", country:"", age:"")
    
    @IBOutlet weak var textFirstName: UITextField!
    @IBOutlet weak var textLastName: UITextField!
    @IBOutlet weak var textCountry: UITextField!
    @IBOutlet weak var textAge: UITextField!
    @IBOutlet weak var textUserInfo: UITextView!
    @IBOutlet weak var textSuccessMessage: UILabel!
    
    @IBAction func addInfoBtn(_ sender: Any) {
        updateUserData()
        enableUserInfo()
        visibility(textSuccessMessage, value: 0)
        
    }
    
    @IBAction func submitInfoBtn(_ sender: Any) {
        if textFirstName.text == "" || textLastName.text == "" || textCountry.text == "" || textAge.text == "" {
            flag = false
            validationMessage(flag)
        } else {
            flag = true
            validationMessage(flag)
        }
    }
    
    @IBAction func clearInfoBtn(_ sender: Any) {
        clearTextFields()
        clearUserData()
        visibility(textSuccessMessage, value: 0)
        disableUserInfo()
    }
    
    func clearTextFields() {
        textFirstName.text = ""
        textLastName.text = ""
        textCountry.text = ""
        textAge.text = ""
    }
    func clearUserData() {
        userData.firstname = ""
        userData.lastname = ""
        userData.country = ""
        userData.age = ""
    }
    
    func updateUserData() {
        userData.firstname = textFirstName.text ?? ""
        userData.lastname = textLastName.text ?? ""
        userData.country = textCountry.text ?? ""
        userData.age = textAge.text ?? ""
    }
    
    func validationMessage(_ flag: Bool) {
        textSuccessMessage.text = flag ? "Successfully Submitted!" : "Complete the missing Info!"
        
        visibility(textSuccessMessage, value: 1)
    }
    
    func enableUserInfo() {
        textUserInfo.text = "Full Name: \(userData.firstname) \(userData.lastname)\nCountry: \(userData.country)\nAge: \(userData.age)"
        
        visibility(textUserInfo, value: 1)
    }
    
    func disableUserInfo() {
        visibility(textUserInfo, value: 0)
    }
    
    func visibility(_ UILabel: UIView, value: Int) {
        UILabel.alpha = CGFloat(value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

