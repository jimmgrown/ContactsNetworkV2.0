//
//  EnterNameVC.swift
//  Contacts
//
//  Created by Sergey on 10.11.2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class EnterNameVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func editTextField(_ sender: Any) {
        changeSaveButton()
    }
    
    @IBAction func editTextNumber(_ sender: Any) {
        changeSaveButton()
    }
    
    func changeSaveButton(){
        if nameTextField.hasText && numberTextField.hasText{
            saveButton.isEnabled = true
        }
        else{
            saveButton.isEnabled = false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = Name.shared.value
        numberTextField.text = Name.sharedNumber.value
    }
    @IBAction func saveName(_ sender: Any) {
        API.createNote(title: nameTextField.text!, text: numberTextField.text!){ result in
            guard result else { return }
            }
        self.navigationController?.popViewController(animated: true)
    }

}

