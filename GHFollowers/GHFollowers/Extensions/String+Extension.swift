//
//  String+Extension.swift
//  GHFollowers
//
//  Created by FOLAHANMI KOLAWOLE on 18/10/2021.
//

import Foundation

extension String {
  
  var isEmailValid: Bool {
    let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
    return emailPredicate.evaluate(with: self)
  }
  
  var isValidPassword: Bool {
    //Regex restricts to 8 characters minimum, 1 capital letter, 1 lowercase letter, 1 number
    let passwordFormat = "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}"
    let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordFormat)
    return passwordPredicate.evaluate(with: self)
  }
  
}
