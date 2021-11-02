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

enum ApiEndpoint {
  static let baseURL = "https://api.github.com/users/"
}

enum GFError: String, Error {
  case invalidUsername = "This username created an invalid request. Please try again."
  case unableToComplete = "Unable to complete your request. Please check your internet connection."
  case invalidResponse = "Invalid response from the server. Please try again."
  case invalidData = "The data received from the server was invalid. Please try again."
}
