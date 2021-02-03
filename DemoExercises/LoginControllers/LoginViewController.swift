//
//  ViewController.swift
//  DemoExercises
//
//  Created by Katty Quintero on 26/03/2019.
//  Copyright © 2019 Katty Quintero. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import FacebookShare
import FBSDKCoreKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTapGesture()
        checkSaveRegister()
        userNameTextField.addLeftView("logoUsuario")
        passwordTextField.addLeftView("candado")
       
    }
    
    //MARK: - LOGIN FACEBOOK
    @IBAction func loginWithFacebook(_ sender: Any) {
        
        let manager = LoginManager()
        manager.logIn(permissions: [.publicProfile, .email],
                      viewController: self) { (result) in
                        switch result {
                        case .cancelled:
                            print("User cancelled login process")
                            break
                        case .success(let grantedPermissions, let declinedPermissions, let token):
                            self.facebookProfile()
                            print("access token == \(token)")
                            break
                        case .failed(let error):
                            print("login failed with error = \(error.localizedDescription)")
                            break
            }
        }
    }
    
    func facebookProfile() {
        
        Profile.loadCurrentProfile { (profile, error) in
            
            guard let firstName = profile?.firstName  else { return }
            guard let imageFacebook = profile?.imageURL(forMode: .normal, size: CGSize(width: 120, height: 120)) else { return }
            guard let lastName = profile?.lastName else { return }
                print (profile?.userID ?? "")
                print(error ?? nil)
            
            guard let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as? DetailLoginViewController else { return }
                detailVC.nameFdk  = firstName
                detailVC.lastName = lastName
                detailVC.imageUrl = imageFacebook
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    
    //MARK: - LOGIN
    @IBAction func loginButton(_ sender: Any) {
        
        if userNameTextField.checkText() == false && passwordTextField.checkText() == false {
            if let text = userNameTextField.text, text.isValidMail() {
                if let text = passwordTextField.text, text.isValidPassword() {
                    guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as? DetailLoginViewController else { return }
                    self.navigationController?.pushViewController(detailVC, animated: true)
                } else { showSimpleAlert(from: .noValidPassword)}
            
            } else { showSimpleAlert(from: .noValidEmail)  }
            
        } else { showSimpleAlert(from: .emptyText) }
    }
}

    //MARK: UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == userNameTextField {
            if !userNameTextField.checkText() {
                if let text = userNameTextField.text, text.isValidMail() {
                    //UtilsTextField().isValidMail(testString: emailTextField.text!) {
                    userNameTextField.resignFirstResponder()
                    passwordTextField.becomeFirstResponder()
                    
                } else { showSimpleAlert(from: .noValidEmail) }
                
            } else { showSimpleAlert(from: .emptyText) }
            
        } else if textField == passwordTextField {
            if !passwordTextField.checkText() {
                if let text = passwordTextField.text, text.isValidPassword() {
                    passwordTextField.resignFirstResponder()
                    loginButton(sendButton)
                    
                } else { showSimpleAlert(from: .noValidPassword)}
                
            } else { showSimpleAlert(from: .emptyText) }
        }
        return true
    }
    
    func checkSaveRegister() {
        
        let email = defaults.value(forKey: keys.email) as? String
        let password = defaults.value(forKey: keys.password) as? String
        if email != nil && password != nil {
        let detailView = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailLoginViewController
        self.navigationController?.pushViewController(detailView, animated: true)
        }
    }
}

