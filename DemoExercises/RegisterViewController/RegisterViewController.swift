//
//  RegisterViewController.swift
//  DemoExercises
//
//  Created by Katty Quintero on 27/03/2019.
//  Copyright © 2019 Katty Quintero. All rights reserved.
//

import UIKit

let defaults = UserDefaults.standard

struct keys {
    static let email    = "emailRegister"
    static let password = "paswordRegister"
}

class RegisterViewController: UIViewController {

    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var repeatPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTapGesture()
        showSimpleAlert(from: .requiredPassword)
        userEmail.addLeftView("logoUsuario")
        userPassword.addLeftView("candado")
        repeatPassword.addLeftView("candado")
    }
    
    @IBAction func registerButton(_ sender: Any) {
        
        //check for empty fields..
        if userEmail.checkText() || userPassword.checkText() || repeatPassword.checkText() {
            showSimpleAlert(from: .emptyText)
        }
        //check if password match
        if (userPassword.text! != repeatPassword.text!) {
            showSimpleAlert(from: .noMatch)
        }
        
        if !userEmail.checkText() && !userPassword.checkText() && !repeatPassword.checkText() {
            if let text = userEmail.text, text.isValidMail() {
                if let text = userPassword.text, text.isValidPassword() {
                    if let text = repeatPassword.text, text.isValidPassword() {
                        let detailView = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailLoginViewController
                        self.navigationController?.pushViewController(detailView, animated: true)
                        saveRegister()
                        
                    } else { showSimpleAlert(from: .noValidPassword) }
                    
                }else { showSimpleAlert(from: .noValidPassword) }
                
            }else { showSimpleAlert(from: .noValidEmail) }
        }
    }
    
    func saveRegister() {
        defaults.set(userEmail.text, forKey: keys.email)
        defaults.set(userPassword.text, forKey: keys.password)
    }
    
    func checkSaveRegister() {
        let email = defaults.value(forKey: keys.email) as? String
        userEmail.text = email
        
        let password = defaults.value(forKey: keys.password) as? String
        userPassword.text = password
    }
}
