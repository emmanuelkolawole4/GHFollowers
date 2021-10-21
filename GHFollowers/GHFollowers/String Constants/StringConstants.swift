//
//  StringConstants.swift
//  GHFollowers
//
//  Created by FOLAHANMI KOLAWOLE on 18/10/2021.
//

import UIKit

enum StringConstants {
  
  enum SearchVC {
    
    enum LogoImageView {
      static let imageName = "gh-logo"
    }
    
    enum GFTextField {
      static let placeholderText = "Enter a username"
    }
    
    enum GFButton {
      static let title = "Get Followers"
    }
    
    enum AlertMessages {
      static let title = "Empty Username"
      static let message = "Please enter a username. We need to know who to look for. 😀"
      static let buttonTitle = "OK"
    }
  }
}

enum Colors {
  static let transparentBlack = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
}
