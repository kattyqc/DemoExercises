//
//  TextFieldExtension.swift
//  DemoExercises
//
//  Created by Katty Quintero on 27/03/2019.
//  Copyright © 2019 Katty Quintero. All rights reserved.
//


import UIKit

extension UITextField {
    
        //Con esta funcion evaluamos si esta vacio el textField
        func checkText() -> Bool {
        
        guard let text = self.text else { return true }
        return text.isEmpty
    }
    
    func addLeftView(_ imageName: String, frame: CGRect? = nil ) {
        let userIconView = UIView()
        userIconView.frame = frame ?? CGRect(x: 0, y: 0, width: 20, height: 20)
        let userIconImageView = UIImageView()
        userIconImageView.frame = frame ?? CGRect(x: 5, y: 3, width: 15, height: 15)
        userIconImageView.image = UIImage(named: imageName)
        userIconView.addSubview(userIconImageView)
        leftView = userIconView
        leftViewMode = .always
    }
}
