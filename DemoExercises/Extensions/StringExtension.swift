//
//  StringExtension.swift
//  DemoExercises
//
//  Created by Katty Quintero on 27/03/2019.
//  Copyright © 2019 Katty Quintero. All rights reserved.
//

import Foundation

extension String {
    
    //establece el formato que debe tener el correo electronico
    func isValidMail() -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@",emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    //se determino que la contraseña contendra un total de (8) caracteres
    func isValidPassword() -> Bool{
        
        let pass8Char = "^.{8}$"
        let result = NSPredicate(format: "SELF MATCHES %@", pass8Char).evaluate(with: self)
        return result
    }
    
}
