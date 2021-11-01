//
//  GFTextField.swift
//  GHFollowers
//
//  Created by FOLAHANMI KOLAWOLE on 18/10/2021.
//

import UIKit

class GFTextField: UITextField {
  
  // MARK: - INITIALIZERS
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - CUSTOM FUNCTIONS
  private func configure() {
    layer.cornerRadius = 10
    layer.borderWidth = 2
    layer.borderColor = UIColor.systemGray4.cgColor
    
    textColor = .label
    tintColor = .label
    textAlignment = .center
    font = UIFont.preferredFont(forTextStyle: .title2)
    adjustsFontSizeToFitWidth = true
    minimumFontSize = 12
    
    backgroundColor = .tertiarySystemBackground
    
    autocorrectionType = .no
    
    placeholder = StringConstants.SearchVC.GFTextField.placeholderText
    
    returnKeyType = .go
    clearButtonMode = .whileEditing
    
    translatesAutoresizingMaskIntoConstraints = false
  }
}
