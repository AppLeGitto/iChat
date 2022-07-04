//
//  Validators.swift
//  iChat
//
//  Created by Марк Кобяков on 04.07.2022.
//

import UIKit

class Validators {
    
    static func isFill(email: String?, password: String?, confirmPassword: String?) -> Bool {
        guard let email = email,
              let password = password,
              let confirmPassword = confirmPassword,
              password != "",
              email != "",
              confirmPassword != ""
        else { return false }
        
        return true
    }
    
    static func isSimpleEmail(email: String?) -> Bool {
        guard let email = email else {
            return false
        }
        
        let emailRegEx = "^.+@.+\\..{2,}$"
        return chek(text: email, regEx: emailRegEx)
    }
    
    private static func chek(text: String, regEx: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predicate.evaluate(with: text)
    }
}
