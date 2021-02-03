//
//  ViewControllerExtension.swift
//  DemoExercises
//
//  Created by Katty Quintero on 27/03/2019.
//  Copyright © 2019 Katty Quintero. All rights reserved.
//

import UIKit

enum AlertType: String {
    case noValidEmail
    case emptyText
    case noValidPassword
    case noMatch
    case requiredPassword
    
    var alertValue: (title: String, message: String) {
        switch self {
        case .noValidEmail: return (title: "Alert", message: "Email Invalido")
        case .emptyText: return (title: "Alert", message: "Todos los espacios son requeridos")
        case .noValidPassword: return (title: "Alert", message: "Password Invalido, debe contener 8 caracteres")
        case .noMatch: return (title: "Alert", message: "Password no coincide")
        case .requiredPassword: return (title: "Alert", message: "Password debe contener 8 caracteres")
        }
    }
}

var vSpinner: UIView?
extension UIViewController {
    
    func showSimpleAlert(title: String, message: String) {
        
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showSimpleAlert(from type: AlertType) {
        self.showSimpleAlert(title: type.alertValue.title, message: type.alertValue.message)
    }
    
    //funcion para gestionar el uso del teclado dentro de la aplicaion cuando no lo requerimos y hacemos un toque fuera del text field
    public func configureTapGesture() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        print("Handle Tap was called")
        view.endEditing(true)
    }
    
    func showSpinner(onView : UIView) {
        
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
